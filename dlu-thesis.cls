% The LaTeX class file should maintain a clean separation between the style and content.
% Users should not have to modify the class file to change the document's content.


%-----------------------------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{dlu-thesis}
[2024/03/05 0.0.1 Dalian University Thesis Template]
\def\version{0.0.1}


%-----------------------------------------------------------------------------------------------------------------------
%mathrsfs
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{upgreek}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{pdfpages}
\RequirePackage{notoccite}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifdlu@istwoside\dlu@istwosidefalse
\newif\ifdlu@adobe\dlu@adobefalse
\DeclareOption{twoside}{\dlu@istwosidetrue}
\DeclareOption{adobe}{\dlu@adobetrue}

\ProcessOptions\relax
\ifdlu@istwoside
    \LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto,fontset=none]{ctexbook}
\else
    \LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto,fontset=none]{ctexbook}
\fi

\setlength{\parskip}{0pt}

%-----------------------------------------------------------------------------------------------------------------------
% Font settings
\ProcessOptions\relax
\ifdlu@adobe
    \setCJKmainfont[AutoFakeBold=true, Path="fonts/adobe/"]{AdobeSongStd-Light.otf}
    \newCJKfontfamily{\songti}   [AutoFakeBold=true, Path="fonts/adobe/"] {AdobeSongStd-Light.otf}
    \newCJKfontfamily{\heiti}    [AutoFakeBold=true, Path="fonts/adobe/"] {AdobeHeitiStd-Regular.otf}
    \newCJKfontfamily{\kaishu}   [AutoFakeBold=true, Path="fonts/adobe/"] {AdobeKaitiStd-Regular.otf}
    \newCJKfontfamily{\fangsong} [AutoFakeBold=true, Path="fonts/adobe/"] {AdobeFangsongStd-Regular.otf}
    \newCJKfontfamily{\xingkai}  [AutoFakeBold=true, Path="fonts/windows/"] {STXingKai.ttf}
    \newCJKfontfamily{\xihei}    [AutoFakeBold=true, Path="fonts/windows/"] {STXiHei.ttf}
    
    %\setCJKmonofont[AutoFakeBold=true, Path="fonts/adobe/"]{AdobeFangsongStd-Regular.otf}
\else
    \setCJKmainfont[AutoFakeBold=true, Path="fonts/windows/"]{SimSun.ttc}
    \newCJKfontfamily{\songti}   [AutoFakeBold=true, Path="fonts/windows/"] {SimSun.ttc}
    \newCJKfontfamily{\heiti}    [AutoFakeBold=true, Path="fonts/windows/"] {SimHei.ttf}
    \newCJKfontfamily{\kaishu}   [AutoFakeBold=true, Path="fonts/windows/"] {SimKai.ttf}
    \newCJKfontfamily{\fangsong} [AutoFakeBold=true, Path="fonts/windows/"] {SimFang.ttf}
    \newCJKfontfamily{\xingkai}  [AutoFakeBold=true, Path="fonts/windows/"] {STXingKai.ttf}
    \newCJKfontfamily{\xihei}    [AutoFakeBold=true, Path="fonts/windows/"] {STXiHei.ttf}
    \newCJKfontfamily{\zhongsong}    [AutoFakeBold=true, Path="fonts/windows/"] {STZHONGS.TTF}
\fi

\setmainfont[
    Path="fonts/windows/",
    BoldFont={timesbd.ttf},
    ItalicFont={timesi.ttf},
    BoldItalicFont={timesbi.ttf},
]{times.ttf}


%-----------------------------------------------------------------------------------------------------------------------

%-----------------------------------------------------------------------------------------------------------------------
% Keys and Values in both Chinese(zh) and English(en)
% Keys
\def\dlu@key@zh@title{论文题目}
\def\dlu@key@en@title{Title of Thesis}

\def\dlu@key@zh@schoolname{学校名称}
\def\dlu@key@en@schoolname{School Name}

\def\dlu@key@zh@thesistype{论文类型}
\def\dlu@key@en@thesistype{Thesis Type}

\def\dlu@key@zh@author{作~~者~~姓~~名：}
\def\dlu@key@en@author{Author Name}

\def\dlu@key@zh@authorid{学~~~~~~~~~~~~~~号：}
\def\dlu@key@en@authorid{Student ID}

\def\dlu@key@zh@advisor{指~~导~~教~~师：}
\def\dlu@key@en@advisor{Supervisor Name}

\def\dlu@key@zh@major{学科~、~专业：}
\def\dlu@key@en@major{Major}

\def\dlu@key@zh@defenddate{答~~辩~~日~~期：}
\def\dlu@key@en@defenddate{Defend Date}

% Values
\def\dlu@value@zh@title{（论文题目）}
\def\dlu@value@en@title{\myThesisTitleEN}

\def\dlu@value@zh@schoolname{大连大学}
\def\dlu@value@en@schoolname{Dalian University}

\def\dlu@value@zh@thesistype{硕~~士~~学~~位~~论~~文}
\def\dlu@value@en@thesistype{Master Thesis}

\def\dlu@value@zh@author{（作者姓名）}
\def\dlu@value@en@author{(Author Name)}

\def\dlu@value@zh@authorid{（学号）}
\def\dlu@value@en@authorid{(Student ID)}

\def\dlu@value@zh@advisor{（导师姓名）}
\def\dlu@value@en@advisor{(Supervisor Name)}

\def\dlu@value@zh@major{（专业）}
\def\dlu@value@en@major{(Major)}

\def\dlu@value@zh@defenddate{\today}
\def\dlu@value@en@defenddate{\today}


%-----------------------------------------------------------------------------------------------------------------------
% New commands for setting values
\renewcommand\title[2]{\def\dlu@value@zh@title{#1}\def\dlu@value@en@title{#2}}
\renewcommand\author[2]{\def\dlu@value@zh@author{#1}\def\dlu@value@en@author{#2}}
\newcommand\authorid[1]{\def\dlu@value@zh@authorid{#1}\def\dlu@value@en@authorid{#1}}
\newcommand\advisor[2]{\def\dlu@value@zh@advisor{#1}\def\dlu@value@en@advisor{#2}}
\newcommand\major[2]{\def\dlu@value@zh@major{#1}\def\dlu@value@en@major{#2}}
\newcommand\defenddate[1]{\def\dlu@value@zh@defenddate{#1}\def\dlu@value@en@defenddate{#1}}

\newcommand{\dlu@value@zh@thesistypetitle}{大连大学硕士论文} 
%-----------------------------------------------------------------------------------------------------------------------
% Labels in both Chinese(zh) and English(en)
\def\dlu@label@zh@thesistypetitle{大连大学硕士学位论文}
\def\dlu@label@en@thesistypetitle{Master~Thesis~of~Dalian~University}

\def\dlu@label@zh@abstract{摘~~~~~~~~要}
\def\dlu@label@en@abstract{Abstract}

\def\dlu@label@zh@keywords{关键词：}
\def\dlu@label@en@keywords{Key Words:~}

\def\dlu@label@zh@toc{目~~~~~~~~录}
\def\dlu@label@en@toc{TABLE OF CONTENTS}

\def\dlu@label@zh@listfigurename{图目录}

\def\dlu@label@zh@listtablename{表目录}

\def\dlu@label@zh@listdenotationname{主要符号表}

\def\dlu@label@zh@references{参~~考~~文~~献}
\def\dlu@label@en@references{References}

\def\dlu@label@zh@appendix{附录}
\def\dlu@label@en@appendix{Appendix}

\def\dlu@label@zh@achievements{攻读硕士学位期间科研项目及科研成果}
\def\dlu@label@en@achievements{Achievements}

\def\dlu@label@zh@acknowledgements{致~~~~~~~~谢}
\def\dlu@label@en@acknowledgements{Acknowledgements}


%-----------------------------------------------------------------------------------------------------------------------
% Page Layout
\RequirePackage[%
    paper=a4paper,
    top=4.1cm,
    bottom=3.5cm,
    left=2.5cm,
    right=2.5cm,
    headsep=1.2cm,
    headheight=0.5cm,
    footskip=1.65cm,
]{geometry}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage{setspace}
\setstretch{1.35}


%-----------------------------------------------------------------------------------------------------------------------
% Title style
\ctexset{%
    chapter={
        name = {},
        number = {\arabic{chapter}},
        format = { \CTEXifname{\raggedright\heiti\zihao{3}}{\centering\heiti\zihao{-3}\text}},,
        %format = { \CTEXifname{\raggedright\heiti\zihao{3}}{\centering\heiti\zihao{-3}\textbf}},,
        pagestyle = {dlu@headings},
        beforeskip = 4bp,
        afterskip = 26bp,
        fixskip = true,
        lofskip = 0pt,
        lotskip = 0pt,
    },
    section={
        format = {\heiti\zihao{4}},
        beforeskip = 14bp,
        afterskip = 14bp,
        fixskip = true,
    },
    subsection={
        format = {\raggedright\heiti\zihao{-4}},
        beforeskip = 13bp,
        afterskip = 13bp,
        fixskip = true,
    },
    subsubsection={
        name = {(,)},
        number = {\arabic{subsubsection}},
        format = {\raggedright\heiti\zihao{-4}},
        beforeskip = 12bp,
        afterskip = 12bp,
        fixskip = true,
    }%
}


%-----------------------------------------------------------------------------------------------------------------------
% Table of contents style
\RequirePackage{titletoc}

\contentsmargin{\z@}

\titlecontents{chapter}
  [0pt]{\songti\zihao{-4}}
  {\thecontentslabel\;}{}
  {\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{section}
  [2\ccwd]{\songti\zihao{-4}}
  {\thecontentslabel\;}{}
  {\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{subsection}
  [4\ccwd]{\songti\zihao{-4}}
  {\thecontentslabel\;}{}
  {\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{figure}
  [0pt]{\songti\zihao{-4}}
  {\figurename\thecontentslabel\;}{\hspace*{-1.5cm}}
  {\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{table}
  [0pt]{\songti\zihao{-4}}
  {\tablename\thecontentslabel\;}{\hspace*{-1.5cm}}
  {\titlerule*[4bp]{.}\thecontentspage}

% Table of contents in Chinese
\newcommand\mktoc{
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\dlu@label@zh@toc}
    %\addcontentsline{toc}{chapter}{\dlu@label@zh@toc}
    \@starttoc{toc}
    \if@restonecol
        \twocolumn
    \fi
}

% Table of contents in English
\newcommand\mktoe{
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\dlu@label@en@toc}
    %\addcontentsline{toc}{chapter}{\dlu@label@en@toc}
    \@starttoc{toe}
    \if@restonecol
        \twocolumn
    \fi
}

\renewcommand\listfigurename{\dlu@label@zh@listfigurename}
\renewcommand\listtablename{\dlu@label@zh@listtablename}


%-----------------------------------------------------------------------------------------------------------------------
% denotation
\newenvironment{denotation}
{\chapter*{\dlu@label@zh@listdenotationname}
    \addcontentsline{toc}{chapter}{\dlu@label@zh@listdenotationname}}
{}


%-----------------------------------------------------------------------------------------------------------------------
% new commands for chapter, section, subsection
\newcommand{\bichapter}[2]
{   \chapter{#1}
    \addcontentsline{toe}{chapter}{\protect\numberline{\csname thechapter\endcsname}#2}
}

\newcommand{\bisection}[2]
{   \section{#1}
    \addcontentsline{toe}{section}{\protect\numberline{\csname thesection\endcsname}#2}
}

\newcommand{\bisubsection}[2]
{   \subsection{#1}
    \addcontentsline{toe}{subsection}{\protect\numberline{\csname thesubsection\endcsname}#2}
}


%-----------------------------------------------------------------------------------------------------------------------
% settings for header and footer
\RequirePackage{fancyhdr}
\fancypagestyle{dlu@empty}{\fancyhf{}}

\fancypagestyle{dlu@headings}{%
    \fancyhf{}
    \fancyfoot[C]{\songti\zihao{-5}{\thepage}}
    \fancyhead[CO]{\zihao{5}{\songti\dlu@label@zh@thesistypetitle}}
    \fancyhead[CE]{\zihao{5}{\songti\dlu@value@zh@thesistypetitle}}
}

\let\dlu@cleardoublepage\cleardoublepage
\newcommand{\dlu@clearemptydoublepage}{%
    \clearpage{\pagestyle{dlu@empty}\dlu@cleardoublepage}}
\let\cleardoublepage\dlu@clearemptydoublepage

\renewcommand{\frontmatter}{
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{dlu@headings}
}

\renewcommand{\mainmatter}{
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{dlu@headings}
}


%-----------------------------------------------------------------------------------------------------------------------
% tables
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}

\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}

\theoremstyle{definition}
\newtheorem{algo}{算法~}[chapter]
\newtheorem{thm}{定理~}[chapter]
\newtheorem{lem}[thm]{引理~}
\newtheorem{prop}[thm]{命题~}
\newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
\newtheorem{defn}{定义~}[chapter]
\newtheorem{conj}{猜想~}[chapter]
\newtheorem{exmp}{例~}[chapter]
\newtheorem{rem}{注~}
\newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

\RequirePackage{xltxtra}
\RequirePackage{graphicx}
\RequirePackage{makecell}
\RequirePackage{wrapfig}

\RequirePackage[labelformat=simple]{subcaption}
\renewcommand{\thesubfigure}{(\alph{subfigure})}


%-----------------------------------------------------------------------------------------------------------------------
% title settings for tables and figures
\RequirePackage{amsmath}
\RequirePackage[list=off]{bicaption}
\RequirePackage[justification=centering]{caption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\songti\zihao{5}}
\captionsetup{
    font = {fontsize},
    labelsep = zhspace,
}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\captionsetup[table][bi-second]{name=Tab.}

\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

\setlength{\intextsep}{12pt}
\setlength{\textfloatsep}{12pt}

%-----------------------------------------------------------------------------------------------------------------------
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


%-----------------------------------------------------------------------------------------------------------------------
% number style for equations, figures and tables
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}


%-----------------------------------------------------------------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{float}


%-----------------------------------------------------------------------------------------------------------------------
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}


%-----------------------------------------------------------------------------------------------------------------------
% algorithm
\newcounter{algorithm}[chapter]
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\renewcommand\thealgorithm{\thechapter.\arabic{algorithm}}
\floatname{algorithm}{算法}


%-----------------------------------------------------------------------------------------------------------------------
% hyperref
\RequirePackage{hyperref}
\hypersetup{
    bookmarksnumbered,
    linktoc=all,
    colorlinks=true,
    citecolor=black,
    filecolor=cyan,
    linkcolor=black,
    linkbordercolor=black,
    urlcolor=black,
    plainpages=false,
    pdfstartview=FitH
}


%-----------------------------------------------------------------------------------------------------------------------
% enumerate
\RequirePackage{enumitem}
\RequirePackage{supertabular}

\setenumerate[1]{label=\arabic*), itemindent=1em, itemsep=0pt, partopsep=0pt, parsep=\parskip, topsep=0pt}


%-----------------------------------------------------------------------------------------------------------------------
% cite the reference style
\RequirePackage[numbers,square,comma,sort&compress,super]{natbib}
\bibliographystyle{references/gbt7714-2005}


%-----------------------------------------------------------------------------------------------------------------------
% dlu space
\newcommand{\dluspace}[1][1]{\hspace{#1\ccwd}}

\def\dlu@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\dluunderline{\@ifnextchar[\dlu@underline\underline}


%-----------------------------------------------------------------------------------------------------------------------
% title page in Chinese
\renewcommand\maketitle
{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \vskip \stretch{1}
        \def\tabcolsep{1pt}
        \def\arraystretch{1.5}
        \parbox[t][4.40cm][c]{\textwidth}
        {
            \begin{center}
                \vspace{3.5cm}
                {\songti\zihao{-1}\textbf{\dlu@value@zh@thesistype}\\}
                \vspace{1.34cm}
                {\xihei\zihao{2}\textbf{\dlu@value@zh@title}\\}
                \vspace{0.13cm}
                {\zihao{3}\textbf{\dlu@value@en@title}\\}
            \end{center}
        }
        \vspace{8.1cm}\\
        {\songti\zihao{-3}\dlu@key@zh@author}\dluunderline[170pt]{\songti\zihao{-3}\dlu@value@zh@author}
            \vskip 10pt
        {\songti\zihao{-3}\dlu@key@zh@authorid}\dluunderline[170pt]{\songti\zihao{-3}\dlu@value@zh@authorid}
            \vskip 10pt
        {\songti\zihao{-3}\dlu@key@zh@advisor}\dluunderline[170pt]{\songti\zihao{-3}\dlu@value@zh@advisor}
            \vskip 10pt
        {\songti\zihao{-3}\dlu@key@zh@major}\dluunderline[170pt]{\songti\zihao{-3}\dlu@value@zh@major}
            \vskip 10pt
        {\songti\zihao{-3}\dlu@key@zh@defenddate}\dluunderline[170pt]{\songti\zihao{-3}\dlu@value@zh@defenddate}
            \\
        \vspace{1.8cm}
        {\Large\xingkai\dlu@value@zh@schoolname\\}
        \vspace{2.3mm}
        {\zihao{-4}\dlu@value@en@schoolname}
    \end{center}
    \vskip \stretch{0.5}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}


%-----------------------------------------------------------------------------------------------------------------------
% originality statement
\newcommand\makeDeclareOriginal{%
    \cleardoublepage
    \pdfbookmark[0]{声明}{statement}
    \thispagestyle{empty}
    \begin{center}
        \parbox[t][1.52cm][c]{\textwidth}
        {\heiti\zihao{-2}\centerline \dlu@label@original}
    \end{center}
    \vskip 10pt
        {\songti\zihao{-4}\dlu@label@originalcontent}
    \vskip 10pt
        {\songti\zihao{-4}\dlu@label@originaltitle}\dluunderline[303pt]{\dlu@value@zh@title}
    \vskip 3pt
    \indent{\songti\zihao{-4}\dlu@label@authorsign} \dluunderline[8em]{} \hspace{1.3em} {\songti\zihao{-4}\dlu@label@originalDate}\dluunderline[4em]{}~年~\dluunderline[2em]{}~月~\dluunderline[2em]{}~日~
    \vskip 20mm
    \begin{center}
        {\heiti\zihao{-2} \dlu@label@authorization}
    \end{center}
    \vskip 10pt
        {\songti\zihao{-4} \dlu@label@authorizationcontent}
    \vskip 25pt
        {\songti\zihao{-4}\dlu@label@originaltitle}\dluunderline[303pt]{\dlu@value@zh@title}
    \vskip 3pt
    \indent{\songti\zihao{-4}\dlu@label@authorsign} \dluunderline[10.65em]{} {\songti\zihao{-4}\dlu@label@originalDate}\dluunderline[3em]{}年~\dluunderline[2em]{}~月~\dluunderline[2em]{}~日~
    \vskip 3pt
    \indent{\songti\zihao{-4}\dlu@label@Supervisorsign} \dluunderline[10.65em]{} {\songti\zihao{-4}\dlu@label@originalDate}\dluunderline[3em]{}~年~\dluunderline[2em]{}~月~\dluunderline[2em]{}~日~
    \vskip 3pt
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}


%-----------------------------------------------------------------------------------------------------------------------
% abstract and keywords in Chinese
\newenvironment{abstract}
{
    
    \cleardoublepage
    
    \chapter{\dlu@label@zh@abstract}
}
{}

\newcommand\beginatevenpage{
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

\newcommand\keywords[1]{%
     \vspace{2ex}\noindent{\heiti\zihao{-4}\bf \dlu@label@zh@keywords} {\bf #1}}


%-----------------------------------------------------------------------------------------------------------------------
% abstract and keywords in English
% abstract and keywords in English
\newenvironment{englishabstract}
{
    \cleardoublepage
    \begin{center}
        %\vspace*{2cm} % 标题与页顶间距
        {\zihao{-3} \dlu@value@en@title} \\ % 英文标题
        \vspace{1cm}
        {\heiti\zihao{-3} \dlu@label@en@abstract} % "ABSTRACT" 标题
    \end{center}
    \vspace{0.5cm}
     \phantomsection % 用于hyperref锚点定位
    \addcontentsline{toc}{chapter}{\dlu@label@en@abstract} % 手动添加目录条目
    %\chapter*{\dlu@label@en@abstract} % 星号章节（无编号）
    
    \par\noindent % 正文开始
    
}
{}

\newcommand\englishkeywords[1]{%
    \vspace{2ex}\noindent{\bf\zihao{-4} \dlu@label@en@keywords} \bf{#1}}




%-----------------------------------------------------------------------------------------------------------------------
% references
\renewenvironment{thebibliography}[1]
{\songti\zihao{5}
    \chapter*{\dlu@label@zh@references}
    \addcontentsline{toc}{chapter}{\dlu@label@zh@references}
    \addcontentsline{toe}{chapter}{\dlu@label@en@references}
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\parsep}{1mm}
        \setlength{\labelsep}{0.5em}
        \setlength{\itemsep}{0.05pc}
        \setlength{\listparindent}{0in}
        \setlength{\itemindent}{0in}
        \setlength{\rightmargin}{0in}
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
}{\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist}


%-----------------------------------------------------------------------------------------------------------------------
% appendix


%-----------------------------------------------------------------------------------------------------------------------
% achievements
\newenvironment{achievements}
{
    \ifodd
        \c@page
    \else
        \clearpage
        \phantom{s}
        \thispagestyle{empty}
    \fi
    \chapter*{\dlu@label@zh@achievements}
    \addcontentsline{toc}{chapter}{\dlu@label@zh@achievements}
    \addcontentsline{toe}{chapter}{\dlu@label@en@achievements}
}{}




%-----------------------------------------------------------------------------------------------------------------------
% acknowledgements
\newenvironment{acknowledgements}
{
    \ifodd
        \c@page
    \else
        \clearpage
        \phantom{s}
        \thispagestyle{empty}
    \fi
    \chapter*{\dlu@label@zh@acknowledgements}
    \addcontentsline{toc}{chapter}{\dlu@label@zh@acknowledgements}
    \addcontentsline{toe}{chapter}{\dlu@label@en@acknowledgements}
}{}


%-----------------------------------------------------------------------------------------------------------------------
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

%-----------------------------------------------------------------------------------------------------------------------

\endinput
%%
%% End of file `dlu-thesis.cls'.
