% 版权信息
% 版权作者：Alwin Tsui <alwintsui@gmail.com>
% 维护者：Quansheng Guan <qshguan@gmail.com>
%         Xi Zhao <535394140@qq.com>
%
% 本文件属于 scutthesis 项目：
% https://github.com/alwintsui/scutthesis
% 经 zhaoxi-scut 修改后发布于：
% https://github.com/zhaoxi-scut/scut_thesis_template
%
% 本文件遵循 GNU General Public License v3（或更高版本）发布。
% 参考并修改自 thuthesis.cls、seuthesis.cls、tjthesis.cls

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scutthesis}[2011/03/31 2.0.1 The LaTeX class for the thesis of South China University of Technology]

% 全局选项
\newif\ifmasterdegree\masterdegreefalse % 默认博士
\newif\ifpdfcover\pdfcoverfalse
\newif\ifblindreview\blindreviewfalse
\newif\ifmanuscript\manuscriptfalse
\newif\ifmaincontent\maincontentfalse

\DeclareOption{pdfcover}{\pdfcovertrue}
% 学位控制
\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{doctor}{\masterdegreefalse}
% 版本控制
\DeclareOption{blindreview}{\blindreviewtrue}
\DeclareOption{submission}{\blindreviewfalse}
\DeclareOption{maincontent}{\maincontenttrue}
% 超链接颜色控制
\DeclareOption{manuscript}{\manuscripttrue}
\DeclareOption{final}{\manuscriptfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany]{book}

% 盲审/提交版通用宏
\newcommand{\blindreview}[1]{\ifblindreview#1\fi}
\newcommand{\submission}[1]{\ifblindreview\else#1\fi}
\newcommand{\achirow}[1]{#1\\\hline}

% 超链接颜色配置：优先由文档类选项控制
\newcommand{\thesishypersetup}{
  \ifmanuscript
    \hypersetup{linkcolor=blue,anchorcolor=black,citecolor=red,filecolor=magenta,menucolor=red,urlcolor=magenta,pdfstartview=FitH}
  \else
    \hypersetup{linkcolor=black,anchorcolor=black,citecolor=black,filecolor=black,menucolor=black,urlcolor=black,pdfstartview=FitH}
  \fi
}

% 成果表格样式统一放在类文件中
\newenvironment{blindachitable}{
  \begin{table}
    \centering{}%
    \pubfont
    \setlength{\tabcolsep}{2pt}
    \begin{longtable}{|>{\centering\arraybackslash}m{0.6cm}|>{\centering\arraybackslash}m{5.7cm}|>{\centering\arraybackslash}m{2.5cm}|>{\centering\arraybackslash}m{1.9cm}|>{\centering\arraybackslash}m{2.7cm}|>{\centering\arraybackslash}m{1.5cm}|}
      \hline\textbf{序号}&\textbf{发表或投稿刊物/会议名称}&
      \textbf{作者（仅注明第几作者）}&
      \textbf{发表年份}&\textbf{与学位论文哪一部分（章、节）相关}&
      \textbf{被索引收录情况}\tabularnewline
      \hline
}{
    \end{longtable}
  \end{table}
}

\newenvironment{subachitable}{
  \begin{table}
    \centering{}%
    \pubfont
    \setlength{\tabcolsep}{2pt}
    \begin{longtable}{|>{\centering\arraybackslash}m{0.6cm}|>{\centering\arraybackslash}m{2.0cm}|>{\centering\arraybackslash}m{4.2cm}|>{\centering\arraybackslash}m{3.0cm}|>{\centering\arraybackslash}m{2.2cm}|>{\centering\arraybackslash}m{1.8cm}|>{\centering\arraybackslash}m{1.0cm}|}
      \hline\textbf{序号}&\textbf{作者（全体作者，按顺序排列）}&
      \textbf{题\texorpdfstring{\quad}{}目}&\textbf{发表或投稿刊物名称、级别}&
      \textbf{发表的卷期、年月、页码}&\textbf{与学位论文哪一部分（章、节）相关}&
      \textbf{被索引收录情况}\tabularnewline
      \hline
}{
    \end{longtable}
  \end{table} 
}

% 基本信息宏
\newcommand{\scutthesis}{
    S\hspace{-0.3ex}\raisebox{-0.5ex}{C}\hspace{-0.3ex}U\hspace{0.1em}\raisebox{-0.5ex}{T}%
    \textsc{Thesis}
}
\def\institute#1{\gdef\@institute{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\ifmasterdegree
    \newcommand{\@degree}{硕士}
\else
    \newcommand{\@degree}{博士}
\fi
\newcommand{\thesissubject}{华南理工大学\@degree{}学位论文}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}

% 常用宏包
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage{amssymb} % 与 xeCJK 有潜在冲突，需在 xeCJK 前加载
\RequirePackage[final]{pdfpages}

% 页面布局
\RequirePackage[left=2.5cm,right=2.5cm,bottom=2.5cm,top=2.5cm,
 headheight=1.5cm,
 footskip=1cm
]{geometry}

% 字体设置
\RequirePackage[BoldFont, SlantFont]{xeCJK}
\RequirePackage{CJKnumb}
\RequirePackage{xCJKnumb} % 用于中文编号（如“第一章”）
\setmainfont[Mapping=tex-text,Path=fonts/,
  BoldFont={Times New Roman - Bold.ttf},
  ItalicFont={Times New Roman - Italic.ttf},
  BoldItalicFont={Times New Roman - Bold Italic.ttf},
]{Times New Roman.ttf} % 英文与数字主字体
\XeTeXlinebreaklocale "zh" % 采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt % 字元间可加入 0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

\setCJKmainfont[Path=fonts/]{SimSun.ttc}
\setCJKsansfont[Path=fonts/]{SimSun.ttc} % 设置默认字体，防止报警
\setCJKmonofont[Path=fonts/]{SimSun.ttc} % 设置默认字体，防止报警
\setCJKfamilyfont{song}[Path=fonts/]{SimSun.ttc}
\setCJKfamilyfont{hei}[Path=fonts/]{SimHei.ttf}
\setCJKfamilyfont{kai}[Path=fonts/]{KaiTi_GB2312.ttf}
\setCJKfamilyfont{fang}[Path=fonts/]{FangSong_GB2312.ttf}

\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}

% 字号定义
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}       % 初号
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}   % 小初
\newcommand{\yihao}{\fontsize{32pt}{36pt}\selectfont}        % 一号
\newcommand{\xiaoyi}{\fontsize{28pt}{32pt}\selectfont}       % 小一
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}        % 二号
\newcommand{\xiaoerhao}{\fontsize{18pt}{20}\selectfont}      % 小二
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}    % 三号
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont} % 小三
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}        % 四号
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}    % 小四
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont}      % 五号
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}     % 小五
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}       % 六号
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont} % 小六
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}      % 七号

% 中文段首缩进
\newlength\CJK@twochars
\def\CJK@spaceChar{\hskip \f@size \p@}
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号

% 排版告警抑制
\raggedbottom
\hbadness=10000 \tolerance=10000 \hfuzz=150pt

% 文档元素字体
\renewcommand{\normalsize}{\xiaosihao\songti\normalfont} % 正文字号：小四宋体
\newcommand{\absnamecn}{\heiti\xiaoerhao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\xiaosihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\heiti\xiaosihao}               % 英文摘要标题字体
\newcommand{\abskeyen}{\bfseries\xiaosihao}   % 英文关键词标题字体
\newcommand{\abskeysen}{\songti\xiaosihao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\songti\wuhao\normalfont} 	% 页眉字体
\newcommand{\toctitlefont}{\heiti\xiaoerhao}            % “目录”字样的字体
\newcommand{\tocchapterfont}{\heiti\xiaosihao} % 目录上第X章的字体
\newcommand{\tocsectionfont}{\normalsize}         % 目录上X.Y节的字体
\newcommand{\tocsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\tocsubsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\textchapterfont}{\centering\heiti\xiaoerhao} % 正文上第X章的字体
\newcommand{\textsectionfont}{\heiti\xiaosanhao}            % 正文上X.Y节的字体
\newcommand{\textsubsectionfont}{\heiti\sihao}     % 正文上X.Y.Z小节的字体
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\songti\wuhao\normalfont}         % 图表标题的字体

\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\pubfont}{\songti\wuhao\normalfont}

\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体
% 图表环境

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % 兼容 subfigure 命令
\RequirePackage{float} % 可以使用［H］命令
\RequirePackage{caption} % 图表标题样式
% 子图引用格式
\DeclareSubrefFormat{parens}{#1 #2)}
\DeclareSubrefFormat{subparens}{#2)}
\DeclareCaptionListOfFormat{parens}{#1 #2)}
\DeclareCaptionListOfFormat{subparens}{#2)}
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 表格名及图名
\captionsetup{ labelsep=space,
  belowskip=0bp,aboveskip=0bp,
  font={capFont}, figurename=图,tablename=表,listfigurename=插图目录,listtablename=表格目录}
\captionsetup[figure]{position=bottom}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,
  justification=centering,labelformat=brace,labelsep=space,subrefformat=subparens,listofformat=parens}

% 表格
\RequirePackage{array}     % 扩展了 array 和 tabular 环境功能
\RequirePackage{booktabs}  % 增加对三线表格的支持 \toprule, \midrule, \bottomrule
\RequirePackage{longtable} % 长表格支持，截断跨页
\captionsetup[table]{position=top}
% 双语表题命令
\newcommand{\TableBicaption}[2]{
  \renewcommand{\tablename}{表}
  \vspace{8pt}
  \caption{#1}
  \vspace{6pt}
  \addtocounter{table}{-1}
  \renewcommand{\tablename}{Table}
  \captionsetup{list=false}
  \caption{#2}
  \captionsetup{list=true}
  \renewcommand{\tablename}{表}
}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}} \setcounter{footnote}{0}

\renewcommand\fps@figure{htbp} % 设置图浮动的默认参数
\renewcommand\fps@table{htbp}

\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

% 列表间距
\def\@listi{%
  \leftmargin\leftmargini
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep
  \partopsep \p@ \@plus\z@ \@minus\p@}

% 代码环境

\RequirePackage{listings}
\definecolor{mygray}{RGB}{245,245,245}
\lstset{
  tabsize=4, %
  frame=tb,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries,
  backgroundcolor=\color{mygray},
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily,
  basicstyle={\footnotesize\ttfamily},
  breaklines=true,
  keepspaces=true, %
  lineskip=-0.1pt,%行距
  fontadjust,
  captionpos=t,
  framextopmargin=1pt,framexbottommargin=1pt,abovecaptionskip=-1pt,belowcaptionskip=1pt,
  extendedchars=false,columns=flexible,mathescape=false,
  breakautoindent=true
}
\renewcommand{\lstlistingname}{代码}

% 目录增强
\RequirePackage[nottoc]{tocbibind} % 自动将参考文献、索引等加入目录

\renewcommand{\bibname}{参考文献}

% 目录样式
\RequirePackage{titletoc}
\renewcommand{\contentsname}{目\texorpdfstring{\quad}{}录}
\titlecontents{chapter}[0ex]{\tocchapterfont}{%
    第\xCJKnumber{\thecontentslabel}章\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{section}[1em]{\tocsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsection}[2em]{\tocsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsubsection}[3em]{\tocsubsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%

% 章节编号与目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

% 标题样式
\RequirePackage[pagestyles, rm]{titlesec}
\renewcommand{\chaptername}{第\xCJKnumber{\thechapter}章}
\titleformat{\chapter}[hang]{\textchapterfont}{第\xCJKnumber{\thechapter}章}{1em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\textsubsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{-20pt}{1pt}
\titlespacing{\section}{0pt}{1pt}{1pt}  % 标题间距
\titlespacing{\subsection}{0pt}{4pt}{0pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont} % 行距命令

\AtBeginDocument{\CJKindent{}%
  \makeindex%
  \normalsize%正文字体格式
  \linespacing{1.682}% 主行距约 1.5 倍
  }

\renewcommand{\maketitle}{
  \ifmaincontent
  \else
    \ifblindreview
      \IfFileExists{cover/cover_blind.pdf}{
        \includepdf[pages={-}]{cover/cover_blind.pdf}
      }{
        \includepdf[pages={-}]{cover/cover.pdf}
      }
    \else
      \includepdf[pages={-}]{cover/cover.pdf}
    \fi
  \fi
}

\newcommand{\keywordsCN}[1]{
  \par
 \vspace{1em}
  \newcommand{\@keywords}{#1}
  {\noindent\abskeycn 关键词：} {\abskeyscn \@keywords}
}
\newcommand{\keywordsEN}[1]{
  \par
 \vspace{1em}
  {\noindent\abskeyen Keywords:} {\abskeysen #1}
}

\newcommand{\abstractx}[1]
{
 \begin{center}
  #1
 \par\end{center}
  \addcontentsline{toc}{chapter}{#1}
}

\renewcommand\frontmatter{ % 标题页后开始摘要与目录
	\clearpage	
    \pagestyle{plain}
    \pagenumbering{Roman}
    \@mainmatterfalse
}

% 定理环境
\RequirePackage{bm} % 数学符号粗体
\RequirePackage{amsmath,amsthm,mathrsfs}
% 允许长公式跨页
\allowdisplaybreaks[4]

\newtheoremstyle{definition}% 样式名
  {0pt}% 上间距
  {0pt}% 下间距
  {}% 正文字体
  {\parindent}% 缩进
  {\bfseries}% 标题字体
  {:}% 标题后标点
  {0.5em}% 标题后间距
  {}% 标题格式
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{说明~}[chapter]
\newtheorem{assumption}{假设~}[chapter]
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]

\newtheoremstyle{plain}% 样式名
  {0pt}% 上间距
  {0pt}% 下间距
  {\itshape}% 正文字体
  {\parindent}% 缩进
  {\bfseries}% 标题字体
  {:}% 标题后标点
  {0.5em}% 标题后间距
  {}% 标题格式
\theoremstyle{plain}

\renewenvironment{proof}{\vskip 1pt\indent  证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip}

% 公式与正文间距
\abovedisplayshortskip=10pt
\belowdisplayshortskip=10pt
\abovedisplayskip=10pt
\belowdisplayskip=10pt

\endinput
