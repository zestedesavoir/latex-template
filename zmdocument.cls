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
\RequirePackage{xparse}

\RequirePackage{pagecolor}

%%% TABLE PACKAGES
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{tabu}

%%% GRAPHIC PACKAGES
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}

\RequirePackage[bookmarks=true,hyperindex=true,bookmarksopen=true,bookmarksnumbered=true]{hyperref}
\RequirePackage[thmmarks,amsmath,hyperref]{ntheorem}
\RequirePackage[hyperrefcolorlinks]{menukeys}

%%% ABBREVIATIONS PACKAGES
\RequirePackage{glossaries}

%%% COLORS DEFINITION

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
\definecolor{quotationcolor}{HTML}{555555}
\definecolor{spoilercolor}{HTML}{555555}
\definecolor{iframecolor}{HTML}{009700}
\definecolor{zblue}{HTML}{094561}
\definecolor{zorange}{HTML}{f8ad32}

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
   \newcommand{\LevelOneTitle}[1]{\displaySpoilers \chapter{#1}}
   \let\LevelTwoTitle\section
   \let\LevelThreeTitle\subsection
   \let\LevelFourTitle\subsubsection
   \let\LevelFiveTitle\paragraph
   \let\LevelSixTitle\subparagaph
   \let\Introduction\addchap
   \newcommand{\Conclusion}[1]{\displaySpoilers \addchap{#1}}
   \automark[section]{chapter}
}
\DeclareOption{big}{
   \newcommand\LevelOneTitle[1]{\displaySpoilers \part{#1}}
   \newcommand\LevelTwoTitle[1]{\displaySpoilers \chapter{#1}}
   \let\LevelThreeTitle\section
   \let\LevelFourTitle\subsection
   \let\LevelFiveTitle\subsubsection
   \let\LevelSixTitle\paragraph
   \let\LevelSevenTitle\subparagaph
   \let\Introduction\addpart
   \newcommand{\Conclusion}[1]{\displaySpoilers \addpart{#1}}
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
\newZdSBox{QuotationBox}{Citation}{quotationcolor}
\newZdSBox{SpoilerBox}{Secret}{spoilercolor}
\newZdSBox{IframeBox}{Élément externe}{iframecolor}

\newZdSBoxEnvironement{Warning}{WarningBox}
\newZdSBoxEnvironement{Question}{QuestionBox}
\newZdSBoxEnvironement{Information}{InformationBox}
\newZdSBoxEnvironement{Error}{ErrorBox}
\newZdSBoxEnvironement{Spoiler}{SpoilerBox}

%%% QUOTATION

\NewDocumentEnvironment{Quotation}{o}{\begin{minipage}{\linewidth}\begin{QuotationBox}}
                                     {\IfValueT{#1}{\hfill(#1)} \end{QuotationBox}\end{minipage}}


%%% IFRAMES

\newenvironment{Iframe}[1]{~\\ \begin{minipage}{\linewidth}\begin{IframeBox}[#1]}{\end{IframeBox}\end{minipage}}

\NewDocumentCommand\iframe{mO{vidéo}o}{%
    \begin{Iframe}{#2}
    Consultez cet élément à l'adresse \url{#1}.\IfValueT{#3}{\\ #3}
    \end{Iframe}
}

%%% SPOILER MANAGEMENT

\let\levelSpoilerTitle\addsec
\let\levelSpoiler\subsection

\newcounter{@spoilerCounter}
\def\@spoilerList{}

\newcommand{\addSpoiler}[1]{%
   \addtocounter{@spoilerCounter}{1}
   \hypertarget{voir:\thepart\thechapter\the@spoilerCounter}{}
   \begin{Spoiler}
   \hyperlink{secret:\thepart\thechapter\the@spoilerCounter}{Voir le secret \the@spoilerCounter.}
   \end{Spoiler}
   \listadd{\@spoilerList}{\expandafter#1}
}

\newcommand{\displaySpoilers}{%
   \setcounter{@spoilerCounter}{1}
   \ifdefvoid{\@spoilerList}{}{\levelSpoilerTitle{Blocs secrets}}
   \def\do{}
   \renewcommand{\do}[1]{\hypertarget{secret:\thepart\thechapter\the@spoilerCounter}{}
                         \levelSpoiler*{Secret \the@spoilerCounter}
                         \expandafter{##1}\\ \hfill \hyperlink{voir:\thepart\thechapter\the@spoilerCounter}
                                                              {Retourner au texte.}
                         \addtocounter{@spoilerCounter}{1}}
   \expandafter\dolistloop{\@spoilerList}
   \def\@spoilerList{}
   \setcounter{@spoilerCounter}{0}
}

\AtEndDocument{\displaySpoilers
\printglossary[title=Liste des abbréviations]}

%%%


%%% TITLE PAGE

\newcommand{\licence}[1]{\def\@licence{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\editor}[1]{\def\@editor{#1}}
\newcommand{\editorlogo}[1]{\def\@editorlogo{#1}}
\newcommand{\authorlink}[1]{\def\@authorlink{#1}}

\renewcommand{\maketitle}{%
    \clearpage
    \thispagestyle{empty}
    \pagecolor{zblue}
    \color{white}
    \ifcsdef{@authorlink}{}{\authorlink{https://zestedesavoir.com/membres/voir}}
    \ifcsdef{@website}{}{\website{https://zestedesavoir.com}}
    \ifcsdef{@editor}{}{\editor{https://zestedesavoir.com}}
    \ifcsdef{@editorlogo}{}{\editorlogo{zestedesavoir.png}}
    \ifcsdef{@logo}{}{\logo{default_logo.png}}
    {
    \raggedleft
    \Large\bf \renewcommand*{\do}[1]{\href{\@authorlink/##1/}{\bsc{##1}}\\}
           \expandafter\docsvlist\expandafter{\@author}\\[1.0 cm]
    \centering
    \vspace*{2.5 cm}
    \includegraphics[height=4cm]{\@logo}\\
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
    \huge\textbf{\@title}\\
    \rule{\linewidth}{0.2 mm} \\[1 cm]
    \large\textbf{Ce tutoriel est sous licence \@licence}\\}
    \vspace{\fill}
    \centering
    \includegraphics[height=2cm]{\@editorlogo}\\
    \href{\@website}{\color{zorange}\@editor}
    \newpage
    \newpagecolor{white}
    \color{black}
    \setcounter{page}{1}
}

\hypersetup{pdftitle={\@title}}
\hypersetup{pdfauthor={\@author}}


%%% IMAGES

\NewDocumentCommand{\image}{mo}{
   \begin{center}
      \includegraphics[max size={\textwidth}{0.9\textheight}, keepaspectratio]{#1}
      \IfValueT{#2}{\captionof{figure}{#2}}
   \end{center}
}

\newcommand{\inlineImage}[1]{\includegraphics[max size={\textwidth}{\textheight}, keepaspectratio]{#1}}

%%%


%% smilies
\newcommand{\smiliesPath}[1]{\def\@smiliesPath{#1}}
\newcommand{\smiley}[1]{\raisebox{-3pt}{\includegraphics[height=15pt]{\@smiliesPath/#1}} }

%%%

\setlength{\tabcolsep}{0.2cm}
\renewcommand{\arraystretch}{1.5}

\newcommand{\horizontalLine}{{\color{gray}\rule{\textwidth}{0.2pt}}}

%%% Abbreviation
\newcommand{\abbr}[2]{%
   \newglossaryentry{#1}{name=#1, description={#2}}%
   \dotuline{\gls{#1}}
}
