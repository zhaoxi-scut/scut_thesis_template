% 华南理工大学文献综述：独立排版、封面和说明页。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scutreview}[2026/10/11 SCUT literature review template]
\LoadClass[12pt,a4paper,fontset=none]{ctexart}
% 本文档独立的字体、字号及表单排版设置；仅字体文件使用上级 fonts。
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{array,tabularx,longtable,multirow,makecell}
\RequirePackage{enumitem}
\RequirePackage[normalem]{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{needspace}
\RequirePackage[unicode=true,colorlinks=false,pdfborder={0 0 0}]{hyperref}
\setmainfont[Path=../public/fonts/,
  BoldFont={Times New Roman - Bold.ttf},
  ItalicFont={Times New Roman - Italic.ttf},
  BoldItalicFont={Times New Roman - Bold Italic.ttf}]{Times New Roman.ttf}
\setCJKmainfont[Path=../public/fonts/,AutoFakeBold=2]{SimSun.ttc}
\setCJKsansfont[Path=../public/fonts/]{SimSun.ttc}
\setCJKmonofont[Path=../public/fonts/]{SimSun.ttc}
\setCJKfamilyfont{song}[Path=../public/fonts/,AutoFakeBold=2]{SimSun.ttc}
\setCJKfamilyfont{hei}[Path=../public/fonts/,AutoFakeBold=2]{SimHei.ttf}
\setCJKfamilyfont{kai}[Path=../public/fonts/]{KaiTi_GB2312.ttf}
\setCJKfamilyfont{fang}[Path=../public/fonts/,AutoFakeBold=2]{FangSong_GB2312.ttf}
\providecommand{\songti}{}
\providecommand{\heiti}{}
\providecommand{\kaiti}{}
\providecommand{\fangsong}{}
\renewcommand{\songti}{\CJKfamily{song}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\renewcommand{\kaiti}{\CJKfamily{kai}}
\renewcommand{\fangsong}{\CJKfamily{fang}}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20pt}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\setlength{\tabcolsep}{5pt}
\renewcommand{\arraystretch}{1.25}
\newcommand{\formcheckbox}{\ensuremath{\square}}
\newcommand{\checkedbox}{\leavevmode\hbox{\rlap{\ensuremath{\checkmark}}\ensuremath{\square}}}
\newcommand{\reviewdegree}{}
\newcommand{\reviewdegreebox}[1]{\ifdefstring{\reviewdegree}{#1}{\checkedbox}{\formcheckbox}}
\newcommand{\formline}[1]{\rule[-0.25em]{#1}{0.45pt}}
\newcommand{\officialsection}[1]{%
  \par\noindent{\songti\xiaosihao\bfseries #1}\par\vspace{0.7em}}
\newcommand{\officialsubsection}[1]{%
  \par\noindent{\songti\xiaosihao\bfseries #1}\par}
\newcommand{\stackchars}[1]{{\renewcommand{\arraystretch}{0.68}\makecell[c]{#1}}}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\AtBeginDocument{\songti\xiaosihao\linespread{1.5}\selectfont}


\geometry{a4paper,left=2.8cm,right=2.8cm,top=2.5cm,bottom=2.5cm,headheight=0pt,headsep=0pt,footskip=1.2cm}
\RequirePackage[backend=biber,style=gb7714-2015,gbalign=gb7714-2015,gbpub=false,gbnamefmt=lowercase]{biblatex}
\newcommand{\reporttype}{研究生学位（毕业）论文文献综述}

\newcommand{\reportthesistitle}{}
\newcommand{\reportauthor}{}
\newcommand{\reportstudentid}{}
\newcommand{\reportdepartment}{}
\newcommand{\reportmajor}{}
\newcommand{\reportsupervisor}{}
\newcommand{\reportdate}{二〇二六年四月}

\newcommand{\reviewtitle}{请填写文献综述题目}
\newcommand{\reviewkeywords}{关键词一；关键词二；关键词三}
\newcommand{\reportsignaturerow}{研究生签名：\formline{1.4cm}\quad 指导教师签名：\formline{1.4cm}\quad 提交日期：\quad 年\quad 月\quad 日}
\newif\ifshowinstructions
\showinstructionstrue
\define@key{review}{title}{\def\reportthesistitle{#1}}
\define@key{review}{author}{\def\reportauthor{#1}}
\define@key{review}{student-id}{\def\reportstudentid{#1}}
\define@key{review}{department}{\def\reportdepartment{#1}}
\define@key{review}{major}{\def\reportmajor{#1}}
\define@key{review}{supervisor}{\def\reportsupervisor{#1}}
\define@key{review}{date}{\def\reportdate{#1}}
\define@key{review}{review-title}{\def\reviewtitle{#1}}
\define@key{review}{keywords}{\def\reviewkeywords{#1}}
\define@key{review}{instructions}{\csname showinstructions#1\endcsname}
\define@key{review}{degree}{%
  \ifblank{#1}{\def\reviewdegree{}}{%
    \ifboolexpr{test {\ifstrequal{#1}{master}} or test {\ifstrequal{#1}{doctor}}}
      {\def\reviewdegree{#1}}
      {\ClassError{scutreview}{Invalid degree '#1'}{Use master, doctor, or an empty value.}}}}
\newcommand{\reviewsetup}[1]{\setkeys{review}{#1}}

\renewcommand{\maketitle}{%
% 文献综述专用封面。
\begin{titlepage}
  \thispagestyle{empty}
  \centering
  \vspace*{-0.4cm}
  \includegraphics[width=9.55cm]{../public/scut-logo.png}\par
  \vspace{0.07cm}
  {\heiti\fontsize{28pt}{40pt}\selectfont\bfseries \reporttype\par}
  % 官方文献综述封面不设论文题目下划线，题目在正文首页填写。
  \vspace{5.33cm}
  % 与开题报告封面一致：标签末字、括号、冒号及横线分列排布。
  {\sihao\begin{tabular}{@{}l@{}c@{}l@{}}
    \makebox[4em][s]{研\hfill 究\hfill 生}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportauthor}\\
    \makebox[4em][l]{指导教师}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportsupervisor}\\
    \makebox[4em][s]{学\hfill 号}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportstudentid}\\
    \makebox[4em][s]{院\hfill\makebox[0.5em][c]{（}系}\makebox[1.0em][c]{）} & \makebox[1em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportdepartment}\\
    \makebox[4em][s]{专\hfill 业}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportmajor}
  \end{tabular}\par}
  \vspace{0.45cm}
  {\sihao\makebox[9.8cm][s]{\reviewdegreebox{doctor}\hspace{0.2cm}博士研究生\hfill\reviewdegreebox{master}\hspace{0.2cm}硕士研究生}\par}
  \vspace{3.25cm}
  {\xiaosihao 华南理工大学研究生院\par}
  \vspace{0.45cm}
  {\xiaosihao \reportdate\par}
  \vspace{1.55cm}
  {\xiaosihao\bfseries\makebox[\textwidth][s]{研究生签名：\hfill 指导教师签名：\hfill 提交日期：\quad 年\quad 月\quad 日}\par}
\end{titlepage}


\newgeometry{left=3cm,right=2.5cm,top=2.5cm,bottom=2.5cm,headheight=0pt,headsep=0pt,footskip=1.2cm}
\setlength{\headwidth}{\textwidth}
\ifshowinstructions
\thispagestyle{empty}
% 说明页整体不可拆分；与封面、正文分别独立成页。
\vspace*{1.1cm}
\noindent\begin{minipage}{\textwidth}
\begin{center}
  {\songti\sanhao\bfseries 说\quad 明}
\end{center}
\vspace{0.8em}
\begingroup
\linespread{1.0}\fontsize{15pt}{27pt}\selectfont\parindent=2em
  \noindent\hspace*{2em}1、文献综述要有题目、作者姓名、摘要、关键词、正文及参考文献。题目由研究生结合学位（毕业）论文选题而定；摘要 500 字以下，关键词 3～5 个，参考文献不少于 30 篇，并应有一定的外文文献。\par
  \indent 2、文献综述要求研究生本人撰写，请勿从网上直接下载，或者抄袭剽窃他人文章。\par
  \indent 3、文献综述用 \textbf{A4} 纸双面打印。字体全部用\textbf{宋体简体}，题目要求用\textbf{小二号字加粗}，\textbf{标题行}要求用\textbf{小四号字加粗}，\textbf{正文}内容要求用\textbf{小四号字}；页边距左为 3cm、右为 2.5cm、上为 2.5cm、下为 2.5cm；其它格式请参照学位论文要求。\par
  \indent 4、文献综述需指导教师签名。\par
\endgroup
\end{minipage}
\clearpage
\fi


\pagenumbering{arabic}
\fancyfoot[C]{\songti\xiaowuhao\thepage}
\pagestyle{fancy}
\noindent\begin{minipage}{\textwidth}
\begin{center}
  {\songti\xiaoerhao\bfseries \reviewtitle\par}
  \vspace{0.7em}
  {\songti\sihao\bfseries \reportauthor\par}
\end{center}
\end{minipage}\par\nopagebreak[4]
\vspace{0.8em}

}
\NewDocumentEnvironment{reviewabstract}{+b}{%
  % 摘要及关键词同页排布，不在两者之间或内部自动分页。
  \noindent\begin{minipage}{\textwidth}
  \songti\xiaosihao\linespread{1.5}\selectfont
  \noindent{\songti\xiaosihao\bfseries 摘要：}%
  {\songti\xiaosihao #1}\par
  \vspace{0.8em}
  \noindent{\songti\xiaosihao\bfseries 关键词：}%
  {\songti\xiaosihao\reviewkeywords}\par
  \end{minipage}\par\vspace{1.8em}
}{}
\RenewDocumentCommand{\section}{s o m}{%
  \par\Needspace{4\baselineskip}%
  \IfBooleanTF{#1}{\officialsection{#3}}{%
    \refstepcounter{section}\setcounter{subsection}{0}%
    \officialsection{\chinese{section}、#3}}\nopagebreak[4]\@afterheading}
% 二级标题采用行内标题：编号、标题和后续正文不能被拆开。
\renewcommand{\thesubsection}{（\chinese{subsection}）}
\RenewDocumentCommand{\subsection}{s o m}{%
  \par\Needspace{3\baselineskip}\addvspace{0.25\baselineskip}%
  \IfBooleanTF{#1}{\def\reviewruninheading{#3：}}{%
    \refstepcounter{subsection}\edef\reviewruninheading{\thesubsection\unexpanded{#3}：}}%
  % 延迟到正文段落开始时输出，main.tex 中的空行不会拆开行内标题。
  \everypar{%
    \setbox\z@\lastbox
    {\songti\xiaosihao\bfseries\reviewruninheading}\nobreak\hspace{0.5em}%
    \clubpenalty=10000\everypar{}}}
\defbibheading{bibliography}{\par\Needspace{4\baselineskip}\vspace{0.8em}\noindent{\heiti\xiaosihao\bfseries 参考文献}\par\nopagebreak[4]}
\renewcommand*{\bibfont}{\songti\wuhao}
\endinput
