## 2026 版华南理工大学硕士（博士）毕业材料

🎉 更优雅、更简洁、更易用的 SCUT 硕博毕业材料 LaTeX 模板 🎉

### 特性

#### 毕业论文

- 支持硕士和博士两种论文类型切换；
- 支持盲审、提交、查重三种模式切换；
- 内置中文和英文字体，跨平台也无需担心字体问题；
- 提供一键生成脚本，生成提交、盲审、查重 PDF 及中文摘要 TXT。
  - Windows 用户可直接双击 scripts 下的 generate.bat 运行；
  - Linux 用户可在终端输入 `bash scripts/generate.sh` 运行。

#### 开题报告与文献综述

- 收录了开题报告和文献综述的 LaTeX 模板！

### 前言

记得在 VS Code 中打开对应的工作空间！

编译前需要安装 Tex Live 编译器，Windows 用户可以从[官网](https://www.tug.org/texlive/)进行下载，Linux 发行版的用户可以通过包管理器安装 Tex Live，例如在 Ubuntu 上可以使用以下命令：

```bash
sudo apt-get install texlive-full
```

Ubuntu 用户安装时间较长，请耐心等待！如果遇到安装时卡住的情况，只需疯狂按回车键即可。

安装完成后，需要在 VS Code 中安装 LaTeX Workshop 扩展，然后通过“文件 → 打开文件夹”，打开要编辑的具体文档目录作为工作空间，也就是说：

- 写毕业论文：打开 `毕业论文/`，编辑 `article.tex`。
- 写开题报告：打开 `开题报告/`，编辑 `main.tex`。
- 写文献综述：打开 `文献综述/`，编辑 `main.tex`。

详细内容请参考具体源文件中的注释，祝好 :)

三个模板共用根目录下的 `public/fonts/` 字体，校名图片也保存在 `public/` 中。请保留这些公共资源与三个文档文件夹的相对位置，不要只复制单个文档文件夹。

## 编译

各文档工作空间内均已装载 `.vscode/settings.json`，完成了常用的编译配置，编译后会在当前目录的 `build/` 文件夹下生成 PDF 文件。

### 快速编译

#### 自动

编辑某个 `*.tex` 文件后，直接按 `Ctrl + S` 保存即可触发快速编译。

#### 手动

确保当前正在编辑的页面（活动页）是你要编译的 `.tex` 文件。在 VS Code 左侧有个“TeX”图标，打开“构建 LaTeX 项目”的菜单栏，点击“配方：快速编译”，即可手动触发快速编译。

### 完整编译

操作同“快速编译>手动”，只需点击“配方：完整编译”即可。

### 一键生成毕业论文提交材料

毕业论文的 `scripts/generate.sh` 和 `scripts/generate.bat` 功能相同。运行前，修改所用脚本顶部的 `school_id`（学校 ID）和 `student_id`（学号）。两个脚本独立保存这两个设置，切换脚本时请保持一致。

在“毕业论文”工作空间的终端运行：

Bash（Linux / Git Bash）：

```bash
bash scripts/generate.sh
```

Windows（PowerShell 或 CMD）：

```powershell
.\scripts\generate.bat
```

Windows 版本使用系统自带的 Windows PowerShell，不需要安装 Bash。两种方式都要求 `xelatex` 和 `biber` 已加入 PATH；也可从其他目录运行脚本，脚本会自动定位毕业论文目录。

每个版本均执行 XeLaTeX → Biber → XeLaTeX → XeLaTeX，结果保存在 `毕业论文/build/out/`：

- `学校ID_学号.pdf`：最终提交版。
- `学校ID_学号_LW.pdf`：匿名盲审版。
- `学校ID_学号_ZT.pdf`：正文查重版。
- `学校ID_学号_ZY.txt`：中文摘要，直接提取源码中的摘要段，保留其中的 LaTeX 命令。

两个脚本都沿用 `unicode,master,对应版本,final` 编译选项，即默认生成硕士论文；运行后恢复 `article.tex` 原来的编译选项。脚本运行期间请勿同时编辑 `article.tex` 或启动其他编译。生成文件会覆盖同名旧文件；编译失败时停止，并返回错误状态。
