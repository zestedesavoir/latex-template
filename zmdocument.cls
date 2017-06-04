\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zmdocument}

\LoadClass[fontsize=12pt,twoside=false,numbers=enddot,parskip=half]{scrbook}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{scrhack}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{minted}
\RequirePackage{amsmath,amssymb}
\RequirePackage[francais]{babel}
\RequirePackage[babel=true]{microtype}
\RequirePackage{capt-of}
\RequirePackage{ulem}
\RequirePackage{etoolbox}

%%% TABLE PACKAGES
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{tabu}

%%% GRAPHIC PACKAGES
\RequirePackage{graphicx}
\RequirePackage{adjustbox}

\RequirePackage[bookmarks=true,hyperindex=true,bookmarksopen=true,bookmarksnumbered=true]{hyperref}
\RequirePackage[thmmarks,amsmath,hyperref]{ntheorem}
\RequirePackage[hyperrefcolorlinks]{menukeys}


%%% COLOR DEFINITION

\definecolor{internallinkcolor}{HTML}{FF9400}

\definecolor{chaptercolor}{HTML}{EA9408}
\definecolor{sectioncolor}{HTML}{EA9408}
\definecolor{subsectioncolor}{HTML}{EA9408}
\definecolor{subsubsectioncolor}{HTML}{EA9408}
\definecolor{paragraphcolor}{HTML}{000000}
\definecolor{subparagraphcolor}{HTML}{000000}

\definecolor{warningcolor}{HTML}{FFAD7A}      %Apricot
\definecolor{errorcolor}{HTML}{FF3B21}        %RedOrange
\definecolor{informationcolor}{HTML}{55E0E0}  %SkyBlue
\definecolor{questioncolor}{HTML}{Ad5CFF}     %Orchid
\definecolor{quotecolor}{HTML}{555555}

\hypersetup{linkcolor=internallinkcolor}


\newcommand{\externalLink}[2]{\href{#2}{#1}}


%%% PRINTING OPTION

\DeclareOption{print}{
   \renewcommand{\externalLink}[2]{\textbf{[#1](#2)}}
}

%%%


%%% SECTIONNING 

\lohead{\headmark}
\chead{}
\pagestyle{scrheadings}
   
\DeclareOption{small}{
   \let\LevelOneTitle\section
   \let\LevelTwoTitle\subsection
   \let\LevelThreeTitle\subsubsection
   \let\LevelFourTitle\paragraph
   \let\LevelFiveTitle\subparagraph
   \let\Introduction\addsec
   \let\Conclusion\addsec
   \def\thesection{\arabic{section}}
   \def\thefigure{\arabic{section}} 
   \def\thetable{\arabic{section}} 
   \automark[subsection]{section}
}

\DeclareOption{middle}{
   \let\LevelOneTitle\chapter
   \let\LevelTwoTitle\section
   \let\LevelThreeTitle\subsection
   \let\LevelFourTitle\subsubsection
   \let\LevelFiveTitle\paragraph
   \let\LevelSixTitle\subparagaph
   \let\Introduction\addchap
   \let\Conclusion\addchap
   \automark[section]{chapter}
}
\DeclareOption{big}{
   \let\LevelOneTitle\part  
   \let\LevelTwoTitle\chapter
   \let\LevelThreeTitle\section
   \let\LevelFourTitle\subsection
   \let\LevelFiveTitle\subsubsection
   \let\LevelSixTitle\paragraph
   \let\LevelSevenTitle\subparagaph
   \let\Introduction\addpart
   \let\Conclusion\addpart
   \automark[chapter]{part}
}
\ProcessOptions

\addtokomafont{chapter}{\color{chaptercolor}}
\addtokomafont{section}{\color{sectioncolor}}
\addtokomafont{subsection}{\color{subsectioncolor}}
\addtokomafont{subsubsection}{\color{sectioncolor}}
\addtokomafont{paragraph}{\color{paragraphcolor}}
\addtokomafont{subparagraph}{\color{subparagraphcolor}}

%\RedeclareSectionCommand[afterskip=.15\baselineskip]{paragraph}
%\RedeclareSectionCommand[indent=0em, afterskip=.15\baselineskip]{subparagraph}

\setcounter{secnumdepth}{4}

%%%


%%% ZDS BOX

\newcommand{\newZdSBox}[3]{{
\theoremprework{~\\ \textcolor{#3}{\rule{0.6\linewidth}{1pt}}}
\theorempostwork{\hfill \textcolor{#3}{\rule{0.6\linewidth}{1pt}} \\}
\theoremindent=2em
\theoremheaderfont{\scshape\hspace{-2em}}
\theoremseparator{ ---}
\theoremstyle{break}
\theorembodyfont{\normalfont}
\newtheorem*{#1}{\textcolor{#3}{#2}}
}}

\newcommand{\newZdSBoxEnvironement}[2]{\newenvironment{#1}{~\\ \begin{minipage}{\linewidth}\begin{#2}}{\end{#2}\end{minipage}}}

\newZdSBox{InformationBox}{Information}{informationcolor}
\newZdSBox{QuestionBox}{Question}{questioncolor}
\newZdSBox{ErrorBox}{Erreur}{errorcolor}
\newZdSBox{WarningBox}{Attention}{warningcolor}
\newZdSBox{QuotationBox}{Citation}{quotecolor}

\newZdSBoxEnvironement{Warning}{WarningBox}
\newZdSBoxEnvironement{Question}{QuestionBox}
\newZdSBoxEnvironement{Information}{InformationBox}
\newZdSBoxEnvironement{Error}{ErrorBox}

\newenvironment{Quotation}[1]{
    \def\quoteAuthor{#1}~\\ 
    \begin{minipage}{\linewidth}\begin{QuotationBox}
}{
    \hfill(\quoteAuthor)
    \end{QuotationBox}\end{minipage}
}

%%%


%%% TITLE PAGE

\newcommand{\licence}[1]{\def\@licence{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\editor}[1]{\def\@editor{#1}}
\newcommand{\authorlink}[1]{\def\@authorlink{#1}}

\renewcommand{\maketitle}{%
    \ifcsdef{@authorlink}{}{\authorlink{https://zestedesavoir.com/membres/voir}}
    \ifcsdef{@website}{}{\website{https://zestedesavoir.com}}
    \ifcsdef{@editor}{}{\editor{Zeste de Savoir}}
    \ifcsdef{@logo}{}{\logo{default_logo.png}}
    {\centering
    \vspace*{0.5 cm}
    \includegraphics[width=\linewidth]{\@logo}\\[1.0 cm]
    \LARGE \renewcommand*{\do}[1]{\href{\@authorlink/##1/}{\bsc{##1}} \qquad}
           \expandafter\docsvlist\expandafter{\@author}\\[2.0 cm]
    \Large \href{\@website}{\@editor}\\[0.5 cm]
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
    \huge\textbf{\@title}\\
    \rule{\linewidth}{0.2 mm} \\[1.5 cm]
    \large\textbf{Ce tutoriel est sous licence \@licence}\\[2 cm]}
}

\hypersetup{pdftitle={\@title}}
\hypersetup{pdfauthor={\@author}}

%% smilies
\newcommand{\smilies}[1]{\def\@smilies{#1}}
\newcommand{\smiliesPath}[1]{\def\@smiliesPath{#1}}
\newcommand{\createSmiley}[1]{\expandafter\def\csname#1Smiley\endcsname{\raisebox{-3pt}{\includegraphics[height=15pt]{\@smiliesPath/#1}} }}

\AtBeginDocument{%
\renewcommand*{\do}[1]{\createSmiley{#1}} 
\expandafter\docsvlist\expandafter{\@smilies}
}

%%%

\setlength{\tabcolsep}{0.2cm}
\renewcommand{\arraystretch}{1.5}

\newcommand{\horizontalLine}{{\color{gray}\rule{\textwidth}{0.2pt}}}
