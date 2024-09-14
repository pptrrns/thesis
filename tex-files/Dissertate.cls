%%%%% %%%%% %%%%% Document class

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Dissertate}[2024/01/05 Dissertate ITAM]

\LoadClass[10pt, oneside, a4paper]{book}

\RequirePackage[paperwidth = 17cm,							% Margins and Size Settings
				paperheight = 22.5cm,
				left = 3cm,
				right = 3cm,
				top = 2.5cm,
				bottom = 2.5cm]{geometry}


%%%%% %%%%% %%%%% etoolbox

\RequirePackage{etoolbox}

%%%%% %%%%% %%%%% Additional LaTeX packages and settings

\usepackage{ragged2e}

\RequirePackage{graphicx}

\RequirePackage{lettrine}

\RequirePackage{setspace}

\RequirePackage{verbatim}

\RequirePackage{color}

\RequirePackage{xcolor}

\usepackage{hyperref}

\RequirePackage{url}

\RequirePackage{amssymb}

\RequirePackage{mathspec}

\RequirePackage{changepage}

\RequirePackage{pdftexcmds}

\RequirePackage{rotating}

\RequirePackage{pdflscape}

%%%%% %%%%% %%%%% Definitions

\def\advisor#1{\gdef\@advisor{#1}}

\def\degreeyear#1{\gdef\@degreeyear{#1}}

\def\degreemonth#1{\gdef\@degreemonth{#1}}

\def\degreeterm#1{\gdef\@degreeterm{#1}}

\def\degree#1{\gdef\@degree{#1}}

\def\university#1{\gdef\@university{#1}}

\def\universitycity#1{\gdef\@universitycity{#1}}

\def\universitystate#1{\gdef\@universitystate{#1}}

\def\investigation#1{\gdef\@investigation{#1}}

\def\press#1{\gdef\@press{#1}}

\def\pressdirection#1{\gdef\@pressdirection{#1}}

%%%%% %%%%% %%%%% Colors

\definecolor{SchoolColor}{RGB}{0, 104, 83}
\definecolor{grey}{RGB}{102, 106, 109}
\definecolor{black}{rgb}{0.0, 0.0, 0.0}
\definecolor{red}{rgb}{0.5843, 0.0902, 0.0157}

% Setup colors

\hypersetup{
    colorlinks = true,
    % colorlinks = false,
    citecolor = red,
    filecolor = red,
    linkcolor = red,
    urlcolor = red,
    urlbordercolor = red
}

%%%%% %%%%% %%%%% Fonts

\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}

\setmathrm{EB Garamond}

\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature = +tnum}}

\widowpenalty = 300

\clubpenalty = 300

\setromanfont[Numbers = OldStyle, Ligatures = {Common, TeX}, Scale = 1.0]{EB Garamond}

\newfontfamily{\smallcaps}[RawFeature = {+c2sc,+scmp}]{EB Garamond}

\setsansfont[Scale = MatchLowercase, BoldFont = {Lato Bold}]{Lato Regular}

\setmonofont[Scale = MatchLowercase]{Source Code Pro}

%%%%% %%%%% %%%%% Code

\RequirePackage{listings}
\lstset{
    columns = fullflexible,
    showspaces = false,
    showtabs = false,
    breaklines = true,
    showstringspaces = false,
    breakatwhitespace = false,
    escapeinside = {(*@}{@*)},
    commentstyle = \color{grey},
    keywordstyle = \color{black},
    stringstyle = \color{black},
    basicstyle = \ttfamily\footnotesize,
    frame = l,
    framesep = 24pt,
    xleftmargin = 24pt,
    tabsize = 2,
    captionpos = t,
    breaklines = true,
    keepspaces = true,
    numbers = left,
    numbersep = 5pt,
    frame = none,
    numberstyle = \ttfamily\color{grey}
}

%%%%% %%%%% %%%%% Spacing

\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.5}
    \newcommand{\dcompressedspacing}{1.25}
}{
    \newcommand{\dnormalspacing}{1.5}
    \newcommand{\dcompressedspacing}{1.25}
}

% Quote Spacing

\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize Spacing

\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate Spacing

\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Edit Spacing

\usepackage{float}
\setlength{\textfloatsep}{0em}
\setlength{\intextsep}{0em}
\setlength{\floatsep}{0em}
\setlength{\abovecaptionskip}{0em}

% Figure

\BeforeBeginEnvironment{figure}{\vspace{1em}}
\AfterEndEnvironment{figure}{\vspace{0em}}

% Table

\BeforeBeginEnvironment{table}{\vspace{1em}}
\AfterEndEnvironment{table}{\vspace{0em}}

% Quote

\BeforeBeginEnvironment{quote}{\vspace{-1.25em}\par\noindent}
\AfterEndEnvironment{quote}{\vspace{-1em}}

% Enumerate & itemize

\RequirePackage{enumitem}
\setlist[itemize]{after = \vspace{-1em}, before = \vspace{-1em}}
\setlist[enumerate]{after = \vspace{-1em}, before = \vspace{-1em}}

% Math

\setlength{\belowdisplayskip}{-1em}
\setlength{\abovedisplayskip}{-1em}

%%%%% %%%%% %%%%% Text settings

\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, it]{titlesec}
\setlength{\headheight}{18pt}
\pagestyle{plain}
\RequirePackage{titling}
\RequirePackage[palatino]{quotchap}
\RequirePackage{lipsum}
\setlength{\parskip}{0em}									% Vertical space in paragraphs
\parindent 0pt 												% Indentation settings

\newcommand{\sectionformat}{\normalfont\itshape}
\titleformat{\section}[block]{\sectionformat}{\thesection}{1em}{}

\providecommand\newthought[1]{
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}
   \noindent\textsc{#1}
}

\DeclareTextFontCommand{\texttt}{\ttfamily\small\color{grey}} 		% Set \texttt to use \footnotesize

% Customize the appearance of chapter headings

\renewcommand{\chaptertitlename}{\color{grey} \textit{Capítulo}}
\titleformat{\chapter}[display]
    {\normalfont\LARGE\raggedleft \vspace{23pt}}{\chaptertitlename\ \thechapter}{-10pt}{\LARGE}

% Customize the appearance of sections, subsection, subsubsection, etc. headings

\titlespacing{\section}{0pt}{0em}{0em}
\titlespacing{\subsection}{0pt}{0em}{0em}
\titlespacing{\subsubsection}{0pt}{0em}{0em}

\titleformat{\paragraph}[runin]
{\normalfont\normalsize\scshape\bfseries}{\theparagraph}{4em}{}[]

\titlespacing{\paragraph}{0pt}{0em}{1em}

\titleformat{\subparagraph}[runin]
{\normalfont\normalsize\scshape}{\theparagraph}{1em}{0em}[]

\titlespacing{\subparagraph}{0pt}{0em}{0em}

% Customize the appearance and behavior of captions

\RequirePackage[labelfont = {bf},
				justification = {centering}, % justified
				textfont = {it},
                singlelinecheck = false,
                margin = 0pt,
                figurewithin = chapter,
                tablewithin = chapter]{caption}
\renewcommand{\tablename}{Tabla}
\renewcommand{\figurename}{Figura}

% Footnotes

\renewcommand{\thefootnote}{\arabic{footnote}}		% Footnote type

% \renewcommand{\thefootnote}{\alph{footnote}}
% \renewcommand{\thefootnote}{\Alph{footnote}}
% \renewcommand{\thefootnote}{\fnsymbol{footnote}}
% \renewcommand{\thefootnote}{\roman{footnote}}
% \renewcommand{\thefootnote}{\Roman{footnote}}

\setlength{\skip\footins}{1em}						% Space before text and footnote
\renewcommand{\footnotesize}{\scriptsize}			% Footnote text size
\usepackage[hang,flushmargin]{footmisc}
\setlength{\footnotemargin}{0.5em}					% Footnote margin
\setlength{\footnotesep}{0.5em}						% Footnote vspace

% \renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
% \renewcommand*{\chapterheadendvskip}{\vspace{1.33\baselineskip}}

%%%%% %%%%% %%%%% Index, appendices and table of contents

\usepackage[titles]{tocloft}
\setcounter{tocdepth}{3} 	% \setcounter{tocdepth}{1}
\setcounter{secnumdepth}{3}	% {3} Determines the level of sectional units (chapters, sections, etc.) that will be included in the toc

% Table of contents dots and font

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}

% Appendices

\usepackage[titletoc]{appendix}
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}
\renewcommand{\appendixname}{Apéndice}						% Rename appendice section to "Apéndice"

% List of tables and list of figures

\renewcommand\listfigurename{Índice de figuras}				% Rename List of figures to "Índice de figuras"
\renewcommand\listtablename{Índice de cuadros}				% Rename List of tables to "Índice de tablas"

% Analytical Index

\RequirePackage{acronym}
\RequirePackage{imakeidx}
\makeindex[name = analytic,title = Índice Analítico]		% Sets up an index named "analytic" with the title "Índice Analítico"
\newcommand{\analyticentry}[1]{\index[analytic]{#1}}		% New command \analyticentry ~ to add a new entry to the index
\newcommand{\analytics}[2]{\index[analytic]{#1|see{#2}}}	% New command \analytics ~ to add a new entry to the index

%%%%% %%%%% %%%%% References

% \RequirePackage{chapterbib}

\renewcommand\bibname{Bibliografía}							% Rename References to "Bibliografía"

% \RequirePackage[super, comma, numbers]{natbib}

\RequirePackage[sectionbib]{natbib}

\renewcommand{\bibnumfmt}[1]{[#1]}

\newlength\mybibindent
\setlength\mybibindent{0pt}									% Indentation settings

% References page settings

\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

%%%%% %%%%% %%%%% Frontmatter pages

\renewcommand{\frontmatter}{
\pagenumbering{roman}
	\input{frontmatter/personalize}
	\maketitle

	\copyrightpage

	\frontispiece

	\newpage
	\blankpage

	\dedicationpage

	\acknowledgments

	\abstractpage
	\preface

	\renewcommand{\contentsname}{Índice general}			% Rename Table of contents to "Índice general"
	\tableofcontents

	\listoffigures
	\phantomsection
	\addcontentsline{toc}{chapter}{Índice de figuras}		% Rename List of Figures to "Índice de figuras"

	\listoftables
	\phantomsection
	\addcontentsline{toc}{chapter}{Índice de cuadros}		% Rename List of tables to "Índice de tablas"

	\newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}

% Change the link color for the table of contents

\addtocontents{toc}{\protect\hypersetup{linkcolor = black}}

% Change the link color for the list of figures

\addtocontents{lof}{\protect\hypersetup{linkcolor = black}}

% Change the link color for the list of tables

\addtocontents{lot}{\protect\hypersetup{linkcolor = black}}

%%%%% %%%%% %%%%% Pages settings

% Maketitle

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
	\Large \@university\\	% \Large \emph{\@university}\\
	\vspace{-15pt}
	\includegraphics[width = 285pt]{figures/logo.pdf}\\
	\vspace{35pt}
	\LARGE \textcolor{grey}{\thetitle}\\
	\normalsize
	\vspace{35pt}
	\@investigation \\
	\vspace{5pt}
	\small QUE PARA OBTENER EL TÍTULO DE\\
	\vspace{5pt}
	\large \@degree\\
	\vspace{5pt}
	\small PRESENTA\\
	\vspace{65pt}
	\Large \textcolor{grey}{\theauthor}\\
	\normalsize
	\vspace{65pt}
	\@advisor \\
	\vspace{10pt}
	\@universitycity \\
	\@degreemonth, \@degreeyear
	\end{center}
}

% Copyright

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{50pt}
	\begin{justify}
	\noindent \small ``Con fundamento en los artículos 21 y 27 de la Ley Federal de Derecho de Autor y como titular de los derechos moral y patrimonial de la obra titulada ``\emph{\thetitle}'', otorgo de manera gratuita y permanente al Instituto Tecnológico Autónomo de México y a la biblioteca Raúl Baillères Jr., autorización para que fijen la obra en cualquier medio, incluido el electrónico, y la divulguen entre sus usuarios, profesores, estudiantes o terceras personas, sin que pueda percibir por tal divulgación una prestación''\\
	\end{justify}
	\begin{center}
	\vspace{50pt}
	\line(1,0){150}\\
	\scshape \noindent \small \theauthor\\
	\vspace{50pt}
	\line(1,0){150}\\
	\scshape \noindent \small \@degreemonth, \@degreeyear
	\end{center}
	\newpage
	\rm
}

% Frontispiece

\newcommand{\frontispiece}{
	\newpage
	\thispagestyle{empty}
	\vspace*{50pt}
	% \vspace*{\fill}
	\begin{center}
    \includegraphics[width = 80pt]{figures/logo.pdf}
	\end{center}
	% \vspace*{\fill}
}

% Dedication

\newcommand{\dedicationpage}{
	\newpage
	\thispagestyle{empty}
	\phantomsection
	% \addcontentsline{toc}{chapter}{Dedicatoria}
	% \newpage
	% \setcounter{page}{4}
	% \vspace*{\fill}
	\vspace*{50pt}
	\begin{center}
	\noindent \large{\input{frontmatter/dedication}}
	% \vspace*{\fill}
	\end{center}
	\newpage
	\rm
}

% Acknowledgments

\newcommand{\acknowledgments}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Agradecimientos}
	\setcounter{page}{5}
	\chapter*{Agradecimientos}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill}
	\newpage
}

% Abstract

\newcommand{\abstractpage}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\chapter*{Abstract}
	\input{frontmatter/abstract}
}

% Preface

\newcommand{\preface}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Resumen}
	\chapter*{Resumen}
	\input{frontmatter/preface}
}

% Backmatter

\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/appendixA}
        \include{chapters/appendixB}
    \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \bibliography{../bib/references}
    \addcontentsline{toc}{chapter}{Bibliografía}
    \bibliographystyle{../bib/apsa}
    % Check https://www.reed.edu/it/help/LaTeX/bibtexstyles.html
    % For more .bts styles check https://www.bibtex.com
}

% Blanck Page

\RequirePackage{afterpage}
\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \addtocounter{page}{-1}%
    \newpage}
