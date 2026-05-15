## 2026 版华南理工大学硕士（博士）毕业论文

### 特性

- 支持字体的彩色和黑白两种模式切换；
- 支持硕士和博士两种论文类型切换；
- 支持盲审、提交、查重三种模式切换；
- 内置中文和英文字体，跨平台也无需担心字体问题；
- 为 Bash 用户提供一键生成脚本，用于快速生成盲审系统提交所需的 PDF 和 TXT 文件；
- 超级详细的注释，便于用户理解和修改。

### 前言

编译前需要安装 Tex Live 编译器，Windows 用户可以从[官网](https://www.tug.org/texlive/)进行下载，Linux 发行版的用户可以通过包管理器安装 Tex Live，例如在 Ubuntu 上可以使用以下命令：

```bash
sudo apt-get install texlive-full
```

安装时间较长，请耐心等待！

具体编写细节请参照 article.tex 文件中的注释！祝好 😀

### 插件配置

在 Visual Studio Code 中安装 LaTeX Workshop 插件，配置推荐如下

```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-output-directory=%OUTDIR%",
        "%DOC%"
      ]
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-output-directory=%OUTDIR%",
        "%DOC%"
      ]
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": [
        "%OUTDIR%/%DOCFILE%"
      ]
    },
    {
      "name": "biber",
      "command": "biber",
      "args": [
        "%OUTDIR%/%DOCFILE%"
      ]
    },
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "-output-directory=%OUTDIR%",
        "%DOC%"
      ]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "SCUT 毕业论文快速编译",
      "tools": [
        "xelatex"
      ]
    },
    {
      "name": "SCUT 毕业论文完整编译",
      "tools": [
        "xelatex",
        "biber",
        "xelatex",
        "xelatex"
      ]
    },
    {
      "name": "英文论文快速编译",
      "tools": [
        "pdflatex"
      ]
    },
    {
      "name": "BibTeX",
      "tools": [
        "bibtex"
      ]
    }
  ],
  "latex-workshop.latex.outDir": "%DIR%/build",
  "[latex]": {
    "editor.wordWrap": "on"
  }
}
```