\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jluthesis}[JLU Thesis document class]

\LoadClass[a4paper,11pt,BCOR=-10mm]{scrartcl}

\RequirePackage[utf8]{inputenc} % encoding
\RequirePackage[english,ngerman]{babel} % languages

\RequirePackage{siunitx}
\RequirePackage{commath}
\RequirePackage[version=4]{mhchem}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{makeidx}
\RequirePackage{wrapfig}
\RequirePackage{url}
\RequirePackage{changepage}
\RequirePackage{enumitem} % advanced enumeration
\RequirePackage{tikz}
\RequirePackage{flowchart}
\RequirePackage[european,EFvoltages]{circuitikz}
\RequirePackage[acronym,toc,automake]{glossaries}

\makeglossaries
\RequirePackage{amsmath} % mathematical function
\RequirePackage{amssymb} % mathematical symbols

\RequirePackage{xifthen}

\RequirePackage{chngcntr} % for per- chapter counters
\RequirePackage[margin=3cm]{geometry}
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}
\RequirePackage[backend=biber]{biblatex}

\RequirePackage{pgfplots}
\usetikzlibrary{arrows, patterns,shapes.geometric,positioning,decorations.pathmorphing} % which tikz libraries to use
\tikzset{>=latex}
\renewcommand{\baselinestretch}{1.5} 
\listfiles
\urlstyle{same} % Url font the same as rest of the text
\RequirePackage{wrapfig}

\RequirePackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}


% +++ Control sequences for titlepage
\def\@faculty{Fachbereich 7}
\def\@program{Physik und Technologie für Raumfahrtanwendungen}
\def\@topic{}
\def\@author{}
\def\@shortauthor{}
\def\@supervisor{}
\def\@reviewer{}
\def\@school{Justus-Liebig-Universität}
\def\@title{}
\def\@matnr{}
\def\@shorttitle{}
\def\@titlepicture{data/jlu-logo.png}
\def\@headpicture{data/jlu-title-logo.png}

\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\topic}[1]{\def\@topic{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\reviewer}[1]{\def\@reviewer{#1}}
\newcommand{\matnr}[1]{\def\@matnr{#1}}
\renewcommand{\author}[2][]{\def\@shortauthor{#1}\def\@author{#2}}
\newcommand{\school}[1]{\def\@school{#1}}
\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\newcommand{\addtoindex}[1]{\textit{#1}\index{#1}}
\renewcommand{\title}[2][]{\def\@shorttitle{#1}\def\@title{#2}}
\newcommand{\titlepicture}[1]{\def\@titlepicture{#1}}
\newcommand{\headpicture}[1]{\def\@headpicture{#1}}
% --- Control sequences for titlepage

% +++ Package options
\DeclareOption{english}{\def\@english{1}} % display in english
\DeclareOption{toc}{\def\@toc{1}} % show table of contents
\DeclareOption{index}{\def\@myindex{1}\makeindex} % show Index at end of document
\DeclareOption{lof}{\def\@lof{1}} % show Table of Figures
\DeclareOption{lot}{\def\@lot{1}} % show Table of Tables
\DeclareOption{lotl}{\def\@lotl{1}} % show TODO list
\DeclareOption{los}{\def\@los{1}} % show Table of Sources
\DeclareOption{abstract}{\def\@abstr{1}} % create an abstract
\DeclareOption{glossary}{\def\@gloss{1}} % create a glossary
\DeclareOption{acronyms}{\def\@acro{1}} % create a list of acronyms

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\makeatother
% --- Package options

% +++ redefine counters
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
% +++ redefine counters

% +++ custom commands
\newcommand{\todolistname}{TODO}
\newlistof{todolist}{todo}{\todolistname\addcontentsline{toc}{section}{\todolistname}}
\newcommand{\todo}[1]{%
	\refstepcounter{todolist}
	\par\noindent\textbf{\textcolor{red}{TODO \thetodolist}: #1}
	\addcontentsline{todo}{todolist}{\protect\numberline{\thetodolist}#1}\par}

\newcommand{\sn}[2]{\ensuremath{{#1}{\cdot}10^{#2}}}
\newcommand{\snsi}[3]{\ensuremath{{#1}{\cdot}10^{#2}\,\si{#3}}}
% --- custom commands

% +++ header and footer definitions
\makeatletter
\pagestyle{scrheadings}
\clearpairofpagestyles
\ihead{\@shorttitle}
\ofoot*{\pagemark}
\ifoot{\@shortauthor}

\addtokomafont{pagefoot}{\small}
\addtokomafont{pagenumber}{\bfseries}
% --- header and footer definitions

\makeatletter
\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\pagenumbering{gobble}
	\begin{adjustwidth}{-1cm}{-1cm}
		\begin{flushright}
			\begin{minipage}{0.3\textwidth}
				\includegraphics[width=\textwidth]{\@titlepicture}
			\end{minipage}
			\hspace{3cm} \\
		\end{flushright}
		\centering
		\vspace*{1cm}
		{\scshape\small \@faculty\par}
		{\scshape\small \@program\par}
		{\scshape\LARGE \@school \par}
		\vspace{1cm}
		{\scshape\Large \@topic\par}
		\vspace{1.5cm}
		{\huge\bfseries \@title\par}
		\vspace{0.5cm}
		{\bfseries\Large \@subtitle\par}
		\vspace{2cm}
		\ifx\@author\empty
		\else
		\begin{flushleft}
			\iflanguage{english}{\large\itshape \textbf{Author:}\\}{}
			\iflanguage{ngerman}{\large\itshape \textbf{Autor:}\\}{}
			\hspace*{1cm}
			\begin{minipage}{0.5\textwidth}
				{\large\itshape \@author}
			\end{minipage}
		\end{flushleft}
		\fi
		\ifx\@matnr\empty
		\else
		\begin{flushleft}
			\iflanguage{english}{\large\itshape \textbf{Matriculation number:}\\}{}
			\iflanguage{ngerman}{\large\itshape \textbf{Matrikelnummer:}\\}{}
			\hspace*{1cm}
			\begin{minipage}{0.5\textwidth}
				{\large\itshape \@matnr}
			\end{minipage}
		\end{flushleft}
		\fi
		\ifx\@reviewer\empty
		\else
		\begin{flushleft}
			\iflanguage{english}{\large\itshape \textbf{Reviewer:}\\}{}
			\iflanguage{ngerman}{\large\itshape \textbf{Gutachter:}\\}{}
			\hspace*{1cm}
			\begin{minipage}{0.5\textwidth}
				{\large\itshape \@reviewer}
			\end{minipage}
		\end{flushleft}
		\fi
		\ifx\@supervisor\empty
		\else
		\begin{flushleft}
			\iflanguage{english}{\large\itshape \textbf{Supervisor:}\\}{}
			\iflanguage{ngerman}{\large\itshape \textbf{Betreuer:}\\}{}
			\hspace*{1cm}
			\begin{minipage}{0.5\textwidth}
				{\large\itshape \@supervisor}
			\end{minipage}
		\end{flushleft}
		\fi
		\vfill
		% Bottom of the page
		\begin{flushright}
			{\large \@date\par}
		\end{flushright}
		\newpage
		\pagenumbering{roman}
	\end{adjustwidth}
}
\makeatother

\makeatletter
\newcommand{\makebeginning}[1]{%
	\ifdefined\@english
	\selectlanguage{english}
	\renewcommand{\contentsname}{Table of Contents}
	\else
	\selectlanguage{ngerman}
	\renewcommand{\indexname}{Stichwortverzeichnis}
	\fi
	
	\maketitle % Titlepage
	
	\ifdefined\@toc
	\thispagestyle{plain}
	\tableofcontents
	\newpage
	\else
	\renewcommand{\numberline}[1]{}
	\renewcommand{\@seccntformat}[1]{}
	\fi
	
	\ifdefined\@lof
	\thispagestyle{plain}
	\iflanguage{english}{\addcontentsline{toc}{section}{List of Figures}}{}
	\iflanguage{ngerman}{\addcontentsline{toc}{section}{Abbildungsverzeichnis}}{}
	\listoffigures
	\newpage
	\fi
	
	\ifdefined\@lot
	\thispagestyle{plain}
	\iflanguage{english}{\addcontentsline{toc}{section}{List of Tables}}{}
	\iflanguage{ngerman}{\addcontentsline{toc}{section}{Tabellenverzeichnis}}{}
	\listoftables
	\newpage
	\fi
	
	\pagenumbering{arabic} % start main pages Numbering
	
	\ifdefined\@abstr
	\iflanguage{english}{\section*{Abstract}\addcontentsline{toc}{section}{Abstract}}{}
	\iflanguage{ngerman}{\section*{Kurzbeschreibung}\addcontentsline{toc}{section}{Abstract}}{}
	\begin{abstract}#1\end{abstract}
	\fi
}
\makeatother

\makeatletter
\newcommand{\makeback}{%
	\newpage
	\setcounter{section}{0}
	\renewcommand*{\thesection}{\Alph{section}}
	\pagenumbering{Roman}
	\ifdefined\@acro
	\iflanguage{english}{\printglossary[type=\acronymtype,title=Acronyms, toctitle=Acronyms]}{}
	\iflanguage{ngerman}{\printglossary[type=\acronymtype,title=Abkürzungen, toctitle=Abkürzungen]}{}
	\clearpage
	\fi
	\ifdefined\@gloss
	\iflanguage{english}{\printglossary[title=Glossary, toctitle=Glossary]}{}
	\iflanguage{ngerman}{\printglossary[title=Glossar, toctitle=Glossar]}{}
	\fi
	\ifdefined\@myindex
	\iflanguage{english}{\addcontentsline{toc}{section}{Index}}{}
	\iflanguage{ngerman}{\addcontentsline{toc}{section}{Stichwortverzeichnis}}{}
	\printindex
	\fi
	\ifdefined\@los
	\iflanguage{english}{\printbibliography[heading=bibintoc,title={References}]}{}
	\iflanguage{ngerman}{\printbibliography[heading=bibintoc,title={Referenzen}]}{}
	\fi
	
	\ifdefined\@lotl
	\listoftodolist
	\fi
}
\makeatother
