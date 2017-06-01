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
\RequirePackage{menukeys}
\RequirePackage{etoolbox}

%%% TABLE PACKAGES
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{tabu}

%%% GRAPHIC PACKAGES
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
\RequirePackage{tikz}

\RequirePackage[bookmarks=true,hyperindex=true,colorlinks=true,linkcolor=YellowOrange,bookmarksopen=true,bookmarksnumbered=true]{hyperref}
\RequirePackage[thmmarks,amsmath,hyperref]{ntheorem}


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

\definecolor{chaptercolor}{HTML}{EA9408}
\definecolor{sectioncolor}{HTML}{EA9408}
\definecolor{subsectioncolor}{HTML}{EA9408}
\definecolor{subsubsectioncolor}{HTML}{EA9408}
\definecolor{paragraphcolor}{HTML}{000000}
\definecolor{subparagraphcolor}{HTML}{000000}

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

\newcommand{\newZdSbox}[3]{{
\theoremprework{~\\ \textcolor{#3}{\rule{0.6\linewidth}{1pt}}}
\theorempostwork{\hfill \textcolor{#3}{\rule{0.6\linewidth}{1pt}} \\}
\theoremheaderfont{\scshape}
\theoremseparator{ ---}
\theoremstyle{break}
\theorembodyfont{\normalfont}
\newtheorem*{#1}{\textcolor{#3}{#2}}
}}

\newZdSbox{Info}{Information}{SkyBlue}
\newZdSbox{Ques}{Question}{Orchid}
\newZdSbox{Err}{Erreur}{RedOrange}
\newZdSbox{Atten}{Attention}{Apricot}

\newenvironment{Attention}{\begin{minipage}{\linewidth}\begin{Atten}}{\end{Atten}\end{minipage}}
\newenvironment{Question}{\begin{minipage}{\linewidth}\begin{Ques}}{\end{Ques}\end{minipage}}
\newenvironment{Information}{\begin{minipage}{\linewidth}\begin{Info}}{\end{Info}\end{minipage}}
\newenvironment{Erreur}{\begin{minipage}{\linewidth}\begin{Err}}{\end{Err}\end{minipage}}

%%%


%%% TITLE PAGE

\newcommand{\licence}[1]{\def\@licence{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}


\renewcommand{\maketitle}{%
    {\centering
    \vspace*{0.5 cm}
    \ifcsdef{@logo}{\includegraphics[width=\linewidth]{\@logo}}{$ $}\\[1.0 cm]
    \LARGE \href{https://zestedesavoir.com/membres/voir/\@author/}{\bsc{\@author}}\\[2.0 cm]
    \Large \href{https://zestedesavoir.com}{Zeste de Savoir}\\[0.5 cm] 
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
    \huge\textbf{\@title}\\
    \rule{\linewidth}{0.2 mm} \\[1.5 cm]  
   \large\textbf{Ce tutoriel est sous licence \@licence}\\[2 cm]}
}

\hypersetup{pdftitle={\@title}}
\hypersetup{pdfauthor={\@author}}

%%%

\lohead{\headmark}
\chead{} 
\automark{section}


\setlength{\tabcolsep}{0.2cm}
\renewcommand{\arraystretch}{1.5}                                    

\newcommand{\horizontalLine}{{\color{gray}\rule{\textwidth}{0.2pt}}} 
