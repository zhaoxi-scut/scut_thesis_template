@echo off
setlocal

rem Copyright (c) 2026, Xi Zhao, South China University of Technology.

rem ################# 请在此处修改以下信息 #################
rem 学校 ID
set "school_id=10561"
rem 学号
set "student_id=202320100381"
rem ########################################################

rem Run the embedded PowerShell payload. No Bash or extra script is required.
set "SCUT_GENERATE_SCRIPT=%~f0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$text = [IO.File]::ReadAllText($env:SCUT_GENERATE_SCRIPT, [Text.Encoding]::UTF8); & ([ScriptBlock]::Create($text.Substring($text.LastIndexOf('# POWERSHELL_PAYLOAD'))))"
exit /b %errorlevel%

# POWERSHELL_PAYLOAD
$ErrorActionPreference = 'Stop'
$scriptDirectory = Split-Path -Parent $env:SCUT_GENERATE_SCRIPT
$thesisDirectory = [IO.Path]::GetFullPath((Join-Path $scriptDirectory '..'))
$outputDirectory = Join-Path $thesisDirectory 'build'
$exportDirectory = Join-Path $outputDirectory 'out'
$sourceFile = Join-Path $thesisDirectory 'article.tex'
$schoolId = $env:school_id
$studentId = $env:student_id
$utf8NoBom = New-Object Text.UTF8Encoding($false)
$classPattern = New-Object Text.RegularExpressions.Regex('^\\documentclass\[.*\]\{scutthesis\}', [Text.RegularExpressions.RegexOptions]::Multiline)
$originalBytes = $null
$exitCode = 0
$previousDirectory = Get-Location

function Invoke-BuildTool {
    param([string]$Command, [string[]]$Arguments, [string]$Step)
    Write-Host "$Step Running $Command..." -ForegroundColor Green
    # Windows PowerShell treats native stderr as ErrorRecord objects; warnings
    # are not failures. The tool's exit code determines whether to stop.
    $savedPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        & $Command @Arguments 1>$null
        $toolExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $savedPreference
    }
    if ($toolExitCode -ne 0) {
        throw "$Command failed with exit code $toolExitCode. Check build/article.log or build/article.blg."
    }
}

function Build-Mode {
    param([string]$Mode, [string]$Suffix)
    $classLine = '\documentclass[unicode,master,' + $Mode + ',final]{scutthesis}'
    $replacement = [Text.RegularExpressions.MatchEvaluator]{ param($match) $classLine }
    $modeSource = $classPattern.Replace($originalText, $replacement, 1)
    [IO.File]::WriteAllText($sourceFile, $modeSource, $utf8NoBom)

    # Only remove the same intermediate files as generate.sh, inside build/.
    foreach ($name in @('article.aux', 'article.toc', 'article.out', 'article.bcf',
        'article.bbl', 'article.blg', 'article.run.xml', 'article.synctex', 'article.synctex.gz')) {
        $intermediate = Join-Path $outputDirectory $name
        if (Test-Path -LiteralPath $intermediate) {
            Remove-Item -LiteralPath $intermediate -Force
        }
    }
    Write-Host "Executing build process for $Mode..." -ForegroundColor Cyan
    $latexArguments = @('-synctex=1', '-interaction=nonstopmode', '-file-line-error',
        "-output-directory=$outputDirectory", $sourceFile)
    Invoke-BuildTool -Command 'xelatex' -Arguments $latexArguments -Step '[1/4]'
    Copy-Item -LiteralPath (Join-Path $thesisDirectory 'article.bib') -Destination (Join-Path $outputDirectory 'article.bib') -Force
    Push-Location -LiteralPath $outputDirectory
    try {
        Invoke-BuildTool -Command 'biber' -Arguments @('article') -Step '[2/4]'
    }
    finally {
        Pop-Location
    }
    Invoke-BuildTool -Command 'xelatex' -Arguments $latexArguments -Step '[3/4]'
    Invoke-BuildTool -Command 'xelatex' -Arguments $latexArguments -Step '[4/4]'
    $outputName = "${schoolId}_${studentId}${Suffix}.pdf"
    Copy-Item -LiteralPath (Join-Path $outputDirectory 'article.pdf') -Destination (Join-Path $exportDirectory $outputName) -Force
    Write-Host "Build completed! => build/out/$outputName" -ForegroundColor Green
}

function Export-ChineseAbstract {
    Write-Host 'Extracting Chinese abstract...' -ForegroundColor Cyan
    $abstractLines = New-Object 'Collections.Generic.List[string]'
    $inBlock = $false
    $foundStart = $false
    $foundEnd = $false
    foreach ($line in ($originalText -split "`n")) {
        if ($line.StartsWith('\chapter{摘\texorpdfstring{\quad}{}要}')) {
            $inBlock = $true
            $foundStart = $true
            continue
        }
        if ($line.StartsWith('\keywordsCN{')) {
            if ($inBlock) { $foundEnd = $true }
            $inBlock = $false
            continue
        }
        if ($inBlock) { $abstractLines.Add($line) }
    }
    if (-not $foundStart -or -not $foundEnd) {
        throw "Failed to extract abstract block. Check chapter/keywords markers in $sourceFile"
    }
    # Match awk + sed: retain LaTeX content; remove leading empty lines and
    # trailing whitespace-only lines. Export UTF-8 without a BOM.
    while ($abstractLines.Count -gt 0 -and $abstractLines[0].Length -eq 0) {
        $abstractLines.RemoveAt(0)
    }
    while ($abstractLines.Count -gt 0 -and [string]::IsNullOrWhiteSpace($abstractLines[$abstractLines.Count - 1])) {
        $abstractLines.RemoveAt($abstractLines.Count - 1)
    }
    $abstractText = $abstractLines -join "`n"
    if ($abstractLines.Count -gt 0) { $abstractText += "`n" }
    $abstractName = "${schoolId}_${studentId}_ZY.txt"
    [IO.File]::WriteAllText((Join-Path $exportDirectory $abstractName), $abstractText, $utf8NoBom)
    Write-Host "Abstract extracted! => build/out/$abstractName" -ForegroundColor Green
}

try {
    Get-Command 'xelatex' -ErrorAction Stop | Out-Null
    Get-Command 'biber' -ErrorAction Stop | Out-Null
    $originalBytes = [IO.File]::ReadAllBytes($sourceFile)
    $originalText = [IO.File]::ReadAllText($sourceFile, [Text.Encoding]::UTF8)
    if (-not $classPattern.IsMatch($originalText)) {
        throw "Cannot find \documentclass line in $sourceFile"
    }
    New-Item -ItemType Directory -Path $exportDirectory -Force | Out-Null
    Set-Location -LiteralPath $thesisDirectory
    Build-Mode -Mode 'submission' -Suffix ''
    Start-Sleep -Seconds 1
    Build-Mode -Mode 'blindreview' -Suffix '_LW'
    Start-Sleep -Seconds 1
    Build-Mode -Mode 'maincontent' -Suffix '_ZT'
    Export-ChineseAbstract
}
catch {
    [Console]::Error.WriteLine($_.Exception.Message)
    $exitCode = 1
}
finally {
    if ($null -ne $originalBytes) {
        try {
            [IO.File]::WriteAllBytes($sourceFile, $originalBytes)
        }
        catch {
            [Console]::Error.WriteLine("Failed to restore article.tex: $($_.Exception.Message)")
            $exitCode = 1
        }
    }
    Set-Location -LiteralPath $previousDirectory.Path
}
exit $exitCode
