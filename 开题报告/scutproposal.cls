% 华南理工大学开题报告：固定排版和官方表单。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scutproposal}[2026/10/11 SCUT proposal template]
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
\RequirePackage[unicode=true,colorlinks=false,pdfborder={0 0 0}]{hyperref}
\setmainfont[Path=../fonts/,
  BoldFont={Times New Roman - Bold.ttf},
  ItalicFont={Times New Roman - Italic.ttf},
  BoldItalicFont={Times New Roman - Bold Italic.ttf}]{Times New Roman.ttf}
\setCJKmainfont[Path=../fonts/,AutoFakeBold=2]{SimSun.ttc}
\setCJKsansfont[Path=../fonts/]{SimSun.ttc}
\setCJKmonofont[Path=../fonts/]{SimSun.ttc}
\setCJKfamilyfont{song}[Path=../fonts/,AutoFakeBold=2]{SimSun.ttc}
\setCJKfamilyfont{hei}[Path=../fonts/,AutoFakeBold=2]{SimHei.ttf}
\setCJKfamilyfont{kai}[Path=../fonts/]{KaiTi_GB2312.ttf}
\setCJKfamilyfont{fang}[Path=../fonts/,AutoFakeBold=2]{FangSong_GB2312.ttf}
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
% 勾选后的方框保持与空框相同宽度，避免改变表格对齐。
\newcommand{\checkedbox}{\leavevmode\hbox{\rlap{\ensuremath{\checkmark}}\ensuremath{\square}}}
\newcommand{\choicebox}[2]{\ifdefstring{#1}{#2}{\checkedbox}{\formcheckbox}}
\newcommand{\formline}[1]{\rule[-0.25em]{#1}{0.45pt}}
\newcommand{\officialsection}[1]{%
  \par\noindent{\heiti\xiaosihao\bfseries #1}\par\vspace{0.35em}}
\newcommand{\officialsubsection}[1]{%
  \par\noindent{\songti\xiaosihao\bfseries #1}\par}
\newcommand{\stackchars}[1]{{\renewcommand{\arraystretch}{0.68}\makecell[c]{#1}}}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\AtBeginDocument{\songti\xiaosihao\linespread{1.5}\selectfont}


\RequirePackage{tabularray}
\renewcommand{\officialsection}[1]{%
  \par\noindent{\fangsong\xiaosihao\bfseries #1}\par\vspace{0.35em}}
\geometry{a4paper,left=2.8cm,right=2.8cm,top=2.5cm,bottom=1.8cm,headheight=0pt,headsep=0pt,footskip=1.2cm}
\newcommand{\reporttype}{研究生学位（毕业）论文开题报告}

\newcommand{\reportthesistitle}{}
\newcommand{\reportauthor}{}
\newcommand{\reportstudentid}{}
\newcommand{\reportdepartment}{}
\newcommand{\reportmajor}{}
\newcommand{\reportsupervisor}{}
\newcommand{\reportdate}{二〇二六年四月}

\newcommand{\reporttitleen}{}
\newcommand{\reportkeywords}{}
\newcommand{\reportkeywordsen}{}
\newcommand{\proposaldegree}{}
\newcommand{\proposalconfidential}{}
\newcommand{\proposalresult}{}
\newcommand{\proposalemployed}{}
\newcommand{\proposalprojectsource}{}
\newcommand{\proposalsecrecylevel}{}
% 空值保留未勾选状态；错误选项直接报错，避免默默生成错误勾选。
\newcommand{\proposalsetchoice}[3]{%
  \ifblank{#3}{\def#1{}}{%
    \def\proposalchoicevalid{0}%
    \def\proposalchoicevalue{#3}%
    \def\proposalcheckvalue##1{%
      \ifdefstring{\proposalchoicevalue}{##1}{\def\proposalchoicevalid{1}}{}}%
    \forcsvlist{\proposalcheckvalue}{#2}%
    \ifnum\proposalchoicevalid=1\relax
      \def#1{#3}%
    \else
      \ClassError{scutproposal}{Invalid checkbox value '#3'}{Use one of: #2, or an empty value.}%
    \fi}}
\define@key{proposal}{title}{\def\reportthesistitle{#1}}
\define@key{proposal}{author}{\def\reportauthor{#1}}
\define@key{proposal}{student-id}{\def\reportstudentid{#1}}
\define@key{proposal}{department}{\def\reportdepartment{#1}}
\define@key{proposal}{major}{\def\reportmajor{#1}}
\define@key{proposal}{supervisor}{\def\reportsupervisor{#1}}
\define@key{proposal}{date}{\def\reportdate{#1}}
\define@key{proposal}{title-en}{\def\reporttitleen{#1}}
\ExplSyntaxOn
\cs_new_protected:Npn \proposalsetkeywords #1
  {
    \tl_set:Nn \l_tmpa_tl {#1}
    \tl_replace_all:Nnn \l_tmpa_tl { ~ } { \hspace{1em} }
    \cs_set:Npx \reportkeywords { \exp_not:V \l_tmpa_tl }
  }
\ExplSyntaxOff
\define@key{proposal}{keywords}{\proposalsetkeywords{#1}}
\define@key{proposal}{keywords-en}{\def\reportkeywordsen{#1}}
\define@key{proposal}{degree}{\proposalsetchoice{\proposaldegree}{master,doctor}{#1}}
\define@key{proposal}{confidential}{\proposalsetchoice{\proposalconfidential}{yes,no}{#1}}
\define@key{proposal}{review-result}{\proposalsetchoice{\proposalresult}{pass,defer}{#1}}
\define@key{proposal}{employed}{\proposalsetchoice{\proposalemployed}{yes,no}{#1}}
\define@key{proposal}{project-source}{\proposalsetchoice{\proposalprojectsource}{government,enterprise,both}{#1}}
\define@key{proposal}{secrecy-level}{\proposalsetchoice{\proposalsecrecylevel}{secret,confidential}{#1}}
\newcommand{\proposalsetup}[1]{\setkeys{proposal}{#1}}
\newcommand{\proposalfillbox}[2]{%
  \noindent\fbox{\vbox to #1{%
    \hsize=\dimexpr\textwidth-2\fboxsep-2\fboxrule\relax
    \wuhao\linespread{1.0}\selectfont\parindent=0pt
    % 正文与框线之间额外留出少量空白，不改变外框尺寸。
    \leftskip=3pt\rightskip=3pt
    \vskip3pt
    #2\par\vfil}}}


\renewcommand{\maketitle}{%
% 开题报告专用封面。
\begin{titlepage}
  \thispagestyle{empty}
  \centering
  \vspace*{0.66cm}
  \includegraphics[width=9.55cm]{../public/scut-logo.png}\par
  \vspace{0.75cm}
  {\heiti\fontsize{28pt}{40pt}\selectfont\bfseries \reporttype\par}
  \vspace{1.80cm}
  {\songti\xiaoerhao\bfseries
    \uline{学位（毕业）论文题目：\ifdefempty{\reportthesistitle}{宋体，小二号字，加粗}{\reportthesistitle}}\par}
  \vspace{3.33cm}
  % 标签末字共用对齐位置，右括号另占半字宽；冒号与横线间距固定。
  {\sihao\begin{tabular}{@{}l@{}c@{}l@{}}
    \makebox[4em][s]{研\hfill 究\hfill 生}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportauthor}\\
    \makebox[4em][l]{指导教师}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportsupervisor}\\
    \makebox[4em][s]{学\hfill 号}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportstudentid}\\
    \makebox[4em][s]{院\hfill\makebox[0.5em][c]{（}系}\makebox[1.0em][c]{）} & \makebox[1em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportdepartment}\\
    \makebox[4em][s]{专\hfill 业}\makebox[0.5em]{} & \makebox[0.5em][c]{：} & \formline{7.0cm}\makebox[0pt][l]{\hspace{-6.9cm}\reportmajor}
  \end{tabular}\par}
  \vspace{1.22cm}
  {\sihao\makebox[9.8cm][s]{\choicebox{\proposaldegree}{doctor}\ 博士研究生\hfill\choicebox{\proposaldegree}{master}\ 硕士研究生}\par}
  \vspace{2.55cm}
  {\xiaosihao 华南理工大学研究生院\par}
  \vspace{0.45cm}
  {\xiaosihao \reportdate\par}
\end{titlepage}


\newgeometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm,headheight=0pt,headsep=0pt,footskip=1.2cm}
\setlength{\headwidth}{\textwidth}
\pagenumbering{arabic}
\fancyfoot[C]{\songti\xiaowuhao - \thepage\ -}
}
% 混合竖排标签逐字堆叠；关闭自动行间距，压缩旋转字符的空白边界。
\newcommand{\proposalabstractlabel}{%
  \vbox{\offinterlineskip
    \halign{\hfil##\hfil\cr
      摘\cr\noalign{\kern1.8cm}
      要\cr\noalign{\kern2pt}
      \rotatebox{-90}{\makebox[0.5em][r]{（}}\cr\noalign{\kern2pt}
      不\cr\noalign{\kern2pt}
      超\cr\noalign{\kern2pt}
      过\cr\noalign{\kern2pt}
      \rotatebox{-90}{800}\cr\noalign{\kern2pt}
      字\cr\noalign{\kern2pt}
      \rotatebox{-90}{\makebox[0.5em][l]{）}}\cr}}}
\newcommand{\proposalmakesummary}{%
\noindent\begin{minipage}[t]{\textwidth}
\officialsection{一、摘要}
\begingroup
\wuhao
\linespread{1.0}\selectfont
\noindent
% 合并单元格采用实际行高居中，避免 multirow 按默认行高计算造成偏移。
\begin{tblr}{
  width=\textwidth, colspec={Q[c,m,wd=0.69cm] Q[c,m,wd=1.17cm] X[l,m]},
  hlines, vlines, colsep=3pt, rowsep=0pt,
  row{1,2}={ht=1.22cm}, row{3}={ht=1.55cm},
  row{4}={ht=16.45cm}, row{5,6}={ht=1.02cm}, row{7}={ht=0.95cm},
  cell{1}{1}={r=2}{c,m}, cell{3,4}{1}={c=2}{c,m},
  cell{5}{1}={r=3}{c,m}, cell{7}{2}={c=2}{l,m}
}
{论\\文\\题\\目} & 中文 & \reportthesistitle \\
 & 英文 & \reporttitleen \\
{论文选题项\\目是否涉密} & &
{\hspace*{3pt}\parbox{\dimexpr\linewidth-3pt\relax}{%
\choicebox{\proposalconfidential}{yes}\hspace{0.2cm}是，并已办理《华南理工大学学位论文定密审批表》审批手续，复印件已附于本报告末页。\\
\choicebox{\proposalconfidential}{no}\hspace{0.2cm}否，并承诺学位论文将不涉及国家秘密和其他不宜公开的内容。}}\\
\proposalabstractlabel & & \parbox[c][16.1cm][t]{\linewidth}{\setlength{\parindent}{0pt}\proposalabstracttext} \\
{关\\键\\词} & 中文 & \reportkeywords \\
 & 英文 & \reportkeywordsen \\
 & {\hspace*{4pt}\raisebox{-1pt}[\height][\depth]{1、关键词数量不少于三个；\ 2、关键词之间空一格（英文用 / 分隔）}} & \\
\end{tblr}
\endgroup
\end{minipage}

}
\NewDocumentEnvironment{proposalabstract}{+b}{%
  \def\proposalabstracttext{#1}\proposalmakesummary}{}
\NewDocumentEnvironment{proposalbasis}{+b}{%
  \clearpage\officialsection{二、立题依据}\proposalfillbox{22.95cm}{#1}}{}
\NewDocumentEnvironment{proposalmethods}{+b}{%
  \clearpage\officialsection{三、研究方案}\proposalfillbox{22.95cm}{#1}}{}
\NewDocumentEnvironment{proposalfoundation}{+b}{%
  \clearpage\officialsection{四、研究条件与基础}\proposalfillbox{22.95cm}{#1}}{}
\newcommand{\planitem}[3]{\rule{0pt}{0.46cm}#1&#2&#3\\\hline}
\newcommand{\proposalmakeplan}[2]{%
  \def\proposalplanrows{#2}%
  \ifblank{#2}{\def\proposalplanrows{%
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
\rule{0pt}{0.46cm}&&\\\hline
}}{}
\clearpage
\officialsection{五、论文工作计划及预期成果}
\begingroup
\wuhao
\renewcommand{\arraystretch}{1.10}
\noindent
\begin{tabularx}{\textwidth}{|C{3.6cm}|X|C{2.8cm}|}
\hline
\multicolumn{3}{|l|}{论文工作进度安排}\\
\hline
起止时间 & \multicolumn{1}{c|}{工作内容} & 备注\\
\hline
\proposalplanrows
\multicolumn{3}{|l|}{\begin{minipage}[t][6.46cm][t]{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}\noindent 预期成果\par\setlength{\parindent}{0pt}#1\end{minipage}}\\
\hline
\end{tabularx}
\endgroup

\vspace{0.50cm}
\officialsection{六、开题报告作者承诺及导师意见}
\begingroup
\wuhao
\noindent\begin{tabular}{|P{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}|}
\hline
\begin{minipage}[t][3.50cm][t]{15.25cm}
\vspace*{0.15cm}
\hspace{2em}我保证上述填报内容的真实性，并将在导师指导下，严格遵守学校的有关规定，按计划认真开展学位（毕业）论文研究工作。\par
\vspace{0.3cm}\hfill 研究生（签名）：\hspace*{5.0cm}\par
\vspace{0.25cm}\hfill 年\qquad\ 月\qquad\ 日\hspace{2.7cm}
\end{minipage}\\
\hline
\begin{minipage}[t][3.50cm][t]{15.25cm}
\vspace*{0.25cm}
\hspace{2em}我已审阅过开题报告的全部内容，同意参加开题报告会。\par
\vspace{0.5cm}\hfill 指导教师（签名）：\hspace*{4.65cm}\par
\vspace{0.25cm}\hfill 年\qquad\ 月\qquad\ 日\hspace{2.7cm}
\end{minipage}\\
\hline
\end{tabular}
\endgroup

% -----------------------------------------------------------------------
% 七、审核意见
}
\NewDocumentEnvironment{proposalplan}{m +b}{\proposalmakeplan{#1}{#2}}{}
\newcommand{\proposalapproval}{%
\clearpage
\officialsection{七、开题报告审核意见}
\begingroup
\wuhao
\renewcommand{\arraystretch}{1.18}
\noindent
\begin{tabularx}{\textwidth}{|C{2.45cm}|C{2.8cm}|C{3.7cm}|X|}
\hline
\multicolumn{4}{|c|}{开题工作小组成员名单}\\
\hline
组成人员 & 姓\quad 名 & 职\quad 称 & \multicolumn{1}{c|}{工作单位}\\\hline
组长&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
成员&&&\\\hline
\end{tabularx}\par\nobreak\nointerlineskip
% 意见栏独立设置列宽，竖线不与上方成员表的第一列绑定。
\noindent\begin{tabularx}{\textwidth}{|l|X|}
\parbox[c][11.2cm][c]{1.55cm}{\centering\stackchars{审\\核\\意\\见}} &
\begin{minipage}[c][11.2cm][t]{\linewidth}
\vspace*{0.72cm}
具体意见：\par\vspace{2.8cm}
审核结果：\par\hspace{4.2cm}
\choicebox{\proposalresult}{pass}\hspace{0.2cm}通过\qquad\qquad
\choicebox{\proposalresult}{defer}\hspace{0.2cm}暂缓通过\par\vspace{0.5cm}
组长签名：\par\vspace{0.7cm}
成员签名：\par\vfill
\hfill 年\qquad\ 月\qquad\ 日\hspace*{1.5cm}\par
\vspace*{0.15cm}
\end{minipage}\\
\hline
\parbox[c][3.5cm][c]{1.55cm}{\centering\stackchars{院\\（系）\\意\\见}} &
\begin{minipage}[c][3.5cm][b]{\linewidth}
\hfill 主管领导签名：\hspace*{3cm}\qquad 院（系）公章\hspace*{1.75cm}\par
\vspace{0.4cm}\hfill 年\qquad\ 月\qquad\ 日\hspace*{1.5cm}\par
\vspace*{0.15cm}
\end{minipage}\\
\hline
\end{tabularx}
\endgroup
\par\vspace{0.15cm}\noindent{\xiaowuhao\bfseries\ 注：开题报告结束后，本表交至院（系）研究生教务员处。}

% -----------------------------------------------------------------------
% 学位论文定密审批表
}
\newcommand{\proposalconfidentiality}{%
\clearpage
\thispagestyle{fancy}
\newgeometry{left=1.7cm,right=1.7cm,top=2.58cm,bottom=1.35cm,headheight=0pt,headsep=0pt,footskip=0.8cm}
\setlength{\headwidth}{\textwidth}
\begin{center}
{\heiti\sanhao 华南理工大学研究生学位论文定密审批表}
\end{center}
\begingroup
\wuhao
\linespread{1.0}\selectfont
% 内框细线、外框粗线；勾选项逐行排列，签名处只留空白。
\noindent\begin{tblr}{
  width=\textwidth,
  colspec={Q[c,m,wd=3.2cm] Q[l,m,wd=2cm] Q[c,m,wd=2.4cm] Q[l,m,wd=2.5cm] Q[c,m,wd=1.9cm] X[l,m] Q[c,m,wd=0.65cm]},
  hlines={0.5pt}, vlines={0.5pt},
  hline{1,Z}={1.2pt}, vline{1,Z}={1.2pt},
  colsep=5pt,
  % 上下留白总量不变：内容下移 0.1cm，减少到下框线的距离。
  rows={abovesep={\dimexpr2pt+0.1cm\relax},belowsep={\dimexpr2pt-0.1cm\relax}},
  column{1}={font=\bfseries},
  row{1,2}={ht=0.85cm}, row{3-7}={ht=1.2cm},
  row{8}={ht=1.45cm}, row{9}={ht=3cm}, row{10}={ht=2.3cm},
  row{11}={ht=1.7cm}, row{12}={ht=2cm}, row{13}={ht=1.5cm}, row{14}={ht=1.15cm}
}
研究生姓名 & & \bfseries 导师姓名 & & \bfseries 学号 & \SetCell[c=2]{l} & \\
所在院（系） & & \bfseries 专业 & \SetCell[c=4]{l} & & & \\
学位类别 & {\choicebox{\proposaldegree}{doctor}\quad 博士\\\choicebox{\proposaldegree}{master}\quad 硕士} &
\bfseries 是否在职人员 & \SetCell[c=4]{l} {\choicebox{\proposalemployed}{yes}\ 是，工作单位：\formline{2.6cm}\\\choicebox{\proposalemployed}{no}\ 否} & & & \\
学位论文题目 & \SetCell[c=4]{l} & & & & \SetCell{c} {\bfseries 论文印制\\\bfseries 份数} & \\
{论文选题来源\\项目名称及代码} & \SetCell[c=6]{l} & & & & & \\
{论文选题\\来源及性质} & \SetCell[c=6]{l} {\proposalprojectbox{government}\quad 国家各部委、省市下达的国家秘密项目\\\proposalprojectbox{enterprise}\quad 企事业单位委托的国家秘密项目} & & & & & \\
学位论文密级 & \SetCell[c=2]{l} {\choicebox{\proposalsecrecylevel}{secret}\quad 秘密\\\choicebox{\proposalsecrecylevel}{confidential}\quad 机密} & &
\SetCell[c=2]{c} \bfseries 学位论文保密期限 & & \SetCell[c=2]{c} 年\quad 月\quad 日 & \\
研究生承诺 & \SetCell[c=6]{l} \begin{minipage}[c][1.2cm][t]{\dimexpr\textwidth-3.2cm-20pt-2.9pt\relax}
\qquad 本人已阅读过《华南理工大学涉密论文保密管理规定》，并承诺遵守此规定。\par\vfill
\makebox[7.3cm][l]{研究生亲笔签名：}年\qquad 月\qquad 日
\end{minipage} & & & & & \\
{学位论文\\定密依据\\（由导师填写）} & \SetCell[c=6]{l} \begin{minipage}[c][2.75cm][b]{\dimexpr\textwidth-3.2cm-20pt-2.9pt\relax}
\makebox[7.0cm][l]{项目负责人亲笔签名：}导师亲笔签名：\par
\vspace{0.3cm}\hspace*{7.3cm}年\qquad 月\qquad 日\par
\vspace{0.15cm}{\bfseries（要求在研究生学位论文开题前由研究生和导师共同提出）}
\end{minipage} & & & & & \\
{在职人员所在\\单位意见\\（非在职人员不需\\填写此栏）} & \SetCell[c=6]{l} \proposalconfidentialsignature{2.05cm}{单位负责人签名：} & & & & & \\
所在院（系）意见 & \SetCell[c=6]{l} \proposalconfidentialsignature{1.45cm}{保密工作主管领导签名：} & & & & & \\
{科学技术处（军工\\项目管理办公室）\\意见} & \SetCell[c=6]{l} \proposalconfidentialsignature{1.75cm}{主管领导签名：} & & & & & \\
研究生院意见 & \SetCell[c=6]{l} \proposalconfidentialsignature{1.25cm}{主管领导签名：} & & & & & \\
备注 & \SetCell[c=6]{l} & & & & & \\
\end{tblr}
\endgroup
% 注释整体内缩，只有“注：”加粗，续行与注释左边缘对齐。
\par\vspace{0.12cm}\noindent\hspace*{0.7cm}%
\begin{minipage}{\dimexpr\textwidth-1.4cm\relax}
\wuhao\linespread{1.2}\selectfont\parindent=0pt
\textbf{注：}此表一式一份，学位论文开题前报送至研究生院学位办公室，否则按公开论文处理。学位论文定密由研究生院学位办公室定期汇总后报学校定密领导小组审核。
\end{minipage}

}
% 意见栏签名靠下排布，日期位置统一，均不绘制签名横线。
\newcommand{\proposalconfidentialsignature}[2]{%
  \begin{minipage}[c][#1][b]{\dimexpr\textwidth-3.2cm-20pt-2.9pt\relax}
    \makebox[7.3cm][l]{#2}年\qquad 月\qquad 日（公章）\par
    \vspace*{0.1cm}
  \end{minipage}}
% 固定的审核、签字及定密表无需用户重复编写。
\newcommand{\proposalprojectbox}[1]{%
  \ifdefstring{\proposalprojectsource}{both}{\checkedbox}{\choicebox{\proposalprojectsource}{#1}}}
\AtEndDocument{\proposalapproval\proposalconfidentiality}
\endinput
