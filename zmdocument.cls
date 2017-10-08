\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zmdocument}

\LoadClass[fontsize=12pt,twoside=false,numbers=enddot,parskip=half]{scrbook}

%%% PACKAGES -------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{scrhack}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{minted}
\RequirePackage{amsmath,amssymb}
\RequirePackage[francais]{babel}
\RequirePackage[babel=true]{microtype}
\RequirePackage{caption}
\RequirePackage{ulem}
\RequirePackage{newfloat}

%% LATEX 3 PACKAGES
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{xsavebox}

\RequirePackage{multicol}
\RequirePackage{pagecolor}

%%% TABLE PACKAGES
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{tabu}

%%% GRAPHIC PACKAGES
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}
\RequirePackage{epstopdf}

\epstopdfDeclareGraphicsRule{.gif}{png}{.png}{convert gif:#1 png:\OutputFile}
\AppendGraphicsExtensions{.gif}

\epstopdfDeclareGraphicsRule{.svg}{pdf}{.pdf}{rsvg-convert -f pdf #1 -o \OutputFile}
\AppendGraphicsExtensions{.svg}

\RequirePackage[bookmarks=true,hyperindex=true,bookmarksopen=true,bookmarksnumbered=true]{hyperref}
\RequirePackage[thmmarks,amsmath,hyperref]{ntheorem}
\RequirePackage[hyperrefcolorlinks]{menukeys}

%%% BOX
\RequirePackage[skins, breakable, minted, xparse]{tcolorbox}

%%% ABBREVIATIONS PACKAGES
\RequirePackage{glossaries}

%%% COLORS ---------------------------------------------------------------------

\definecolor{defaultColor}{HTML}{424242}

\definecolor{internalLinkColor}{HTML}{FF9400}
\definecolor{externalLinkColor}{HTML}{1088BF}

\definecolor{chapterColor}{HTML}{EA9408}
\definecolor{sectionColor}{HTML}{EA9408}
\definecolor{subsectionColor}{HTML}{EA9408}
\definecolor{subsubsectionColor}{HTML}{EA9408}
\definecolor{paragraphColor}{HTML}{000000}
\definecolor{subparagraphColor}{HTML}{000000}

\definecolor{warningColor}{HTML}{FFAD7A}      %Apricot
\definecolor{errorColor}{HTML}{FF3B21}        %RedOrange
\definecolor{informationColor}{HTML}{55E0E0}  %SkyBlue
\definecolor{questionColor}{HTML}{Ad5CFF}     %Orchid
\definecolor{quotationColor}{HTML}{555555}
\definecolor{spoilerColor}{HTML}{555555}
\definecolor{iframeColor}{HTML}{009700}

\definecolor{titlePageBackgroundColor}{HTML}{094561}
\definecolor{titlePageEditorColor}{HTML}{F8AD32}
\definecolor{titlePageTextColor}{HTML}{FFFFFF}
\definecolor{titlePageAuthorColor}{HTML}{FF9400}

\definecolor{codeBackgroundColor}{HTML}{F7F7F7}
\definecolor{highlightCodeColor}{HTML}{E3E3E3}
\definecolor{lineNumberSeparatorCodeColor}{HTML}{BEBEC5}

\definecolor{horizontalLineColor}{HTML}{CCCCCC}

%%%  BOX

% SUCCESS
\definecolor{ZdSBoxForegroundSuccess}{HTML}{3C763D}
\definecolor{ZdSBoxBackgroundSuccess}{HTML}{DFF0D8}
\definecolor{ZdSBoxBorderSuccess}{HTML}{C6D7BF}
\definecolor{ZdSBoxLogoBackgroundSuccess}{HTML}{16C13B}

% INFORMATION
\definecolor{ZdSBoxForegroundInformation}{HTML}{31708F}
\definecolor{ZdSBoxBackgroundInformation}{HTML}{D9EDF7}
\definecolor{ZdSBoxBorderInformation}{HTML}{C0D4DE}
\definecolor{ZdSBoxLogoBackgroundInformation}{HTML}{59ABE3}

% QUESTION
\definecolor{ZdSBoxForegroundQuestion}{HTML}{8D61CD}
\definecolor{ZdSBoxBackgroundQuestion}{HTML}{F0E9FC}
\definecolor{ZdSBoxBorderQuestion}{HTML}{D3BDF5}
\definecolor{ZdSBoxLogoBackgroundQuestion}{HTML}{8C4FE8}

% WARNING
\definecolor{ZdSBoxForegroundWarning}{HTML}{8A6D3B}
\definecolor{ZdSBoxBackgroundWarning}{HTML}{FCF4E5}
\definecolor{ZdSBoxBorderWarning}{HTML}{E3DBCC}
\definecolor{ZdSBoxLogoBackgroundWarning}{HTML}{F39539}

% ERROR
\definecolor{ZdSBoxForegroundError}{HTML}{A94442}
\definecolor{ZdSBoxBackgroundError}{HTML}{F2DEDE}
\definecolor{ZdSBoxBorderError}{HTML}{D9C5C5}
\definecolor{ZdSBoxLogoBackgroundError}{HTML}{C21936}

% SPOILER
\definecolor{ZdSBoxForegroundSpoiler}{HTML}{555555}
\definecolor{ZdSBoxBackgroundSpoiler}{HTML}{EEEEEE}
\definecolor{ZdSBoxBorderSpoiler}{HTML}{DDDDDD}

% QUOTATION
\definecolor{ZdSBoxBorderLeftQuotation}{HTML}{CCCCCC}
\definecolor{ZdSBoxForegroundQuotation}{HTML}{555555}

\hypersetup{linkcolor=internalLinkColor}

%%% CONSTANTS ------------------------------------------------------------------

\setlength{\tabcolsep}{0.2cm}
\renewcommand{\arraystretch}{1.5}

%%% FLOATS ---------------------------------------------------------------------

\DeclareFloatingEnvironment[name={Équation}]{equationFloat}

%%% ICONS ----------------------------------------------------------------------

\def\boxIcon{[draw=none] circle (0.4cm)}

\def\linkIcon{\tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{%
\begin{scope}[x=1ex, y=1ex]
   \clip (-0.1,-0.1)
   --++ (-0, 1.2)
   --++ (0.6, 0)
   --++ (0, -0.6)
   --++ (0.6, 0)
   --++ (0, -1);
   \path[draw,
   line width = 0.5,
   rounded corners=0.5]
   (0,0) rectangle (1,1);
\end{scope}
\path[draw, line width = 0.5] (0.5, 0.5) -- (1, 1);
\path[draw, line width = 0.5] (0.6, 1) -- (1, 1) -- (1, 0.6);}
}

\def\spoilerIcon{%
\begin{tikzpicture}[scale=0.05]
  \draw[semithick](-3,0) .. controls (-2,2.5) and (2,2.5) .. (3,0) .. controls (2,-2.5) and (-2,-2.5) .. (-3,0)--cycle;
  \draw[thin](0,0.6) arc (90:180:0.6cm);
  \draw (0,0) circle [radius=1.2];
\end{tikzpicture}}

%%% CLASS OPTIONS --------------------------------------------------------------

%%% PRINTING OPTION
\DeclareOption{print}{
   \renewcommand{\externalLink}[2]{\textbf{[#1](#2)}}
}

%%% SECTIONNING OPTIONS
\lohead{\headmark}
\chead{}
\pagestyle{scrheadings}

\DeclareOption{small}{
   \let\levelOneTitle\section
   \let\levelTwoTitle\subsection
   \let\levelThreeTitle\subsubsection
   \let\levelFourTitle\paragraph
   \let\levelFiveTitle\subparagraph
   \newcommand{\levelOneIntroduction}{\addsec{Introduction}}
   \newcommand{\levelOneConclusion}{\addsec{Conclusion}}
   \def\thesection{\arabic{section}}
   \def\thefigure{\arabic{section}}
   \def\thetable{\arabic{section}}
   \def\theequationFloat{\arabic{section}}
   \automark[subsection]{section}
}

\DeclareOption{middle}{
   \newcommand{\levelOneTitle}[1]{\displaySpoilers \chapter{#1}}
   \let\levelTwoTitle\section
   \let\levelThreeTitle\subsection
   \let\levelFourTitle\subsubsection
   \let\levelFiveTitle\paragraph
   \let\levelSixTitle\subparagaph
   \newcommand{\levelOneIntroduction}{\addchap{Introduction}}
   \newcommand{\levelOneConclusion}{\displaySpoilers \addchap{Conclusion}}
   \newcommand{\levelTwoIntroduction}{\addsec{Introduction}}
   \newcommand{\levelTwoConclusion}{\addsec{Conclusion}}
   \automark[section]{chapter}
}

\DeclareOption{big}{
   \newcommand\levelOneTitle[1]{\displaySpoilers \part{#1}}
   \newcommand\levelTwoTitle[1]{\displaySpoilers \chapter{#1}}
   \let\levelThreeTitle\section
   \let\levelFourTitle\subsection
   \let\levelFiveTitle\subsubsection
   \let\levelSixTitle\paragraph
   \let\levelSevenTitle\subparagaph
   \newcommand{\levelOneIntroduction}{\addpart{Introduction}}
   \newcommand{\levelOneConclusion}{\displaySpoilers \addpart{Conclusion}}
   \newcommand{\levelTwoIntroduction}{\addchap{Introduction}}
   \newcommand{\levelTwoConclusion}{\displaySpoilers \addchap{Conclusion}}
   \newcommand{\levelThreeIntroduction}{\addsec{Introduction}}
   \newcommand{\levelThreeConclusion}{\addsec{Conclusion}}
   \automark[chapter]{part}
}

%%% NOCOLOR
\DeclareOption{nocolor}{
   \definecolor{titlePageBackgroundColor}{HTML}{FFFFFF}
   \definecolor{titlePageEditorColor}{HTML}{000000}
   \definecolor{titlePageTextColor}{HTML}{000000}
}

%%% PROCESSING
\ProcessOptions

%%% POST-PROCESSING
\addtokomafont{chapter}{\color{chapterColor}}
\addtokomafont{section}{\color{sectionColor}}
\addtokomafont{subsection}{\color{subsectionColor}}
\addtokomafont{subsubsection}{\color{sectionColor}}
\addtokomafont{paragraph}{\color{paragraphColor}}
\addtokomafont{subparagraph}{\color{subparagraphColor}}

\setcounter{secnumdepth}{4}

%%% CUSTOMS ENVIRONMENTS AND MACROS ------------------------------------------

%%% LINKS
\newcommand{\externalLink}[2]{\href{#2}{\color{externalLinkColor}{#1~\linkIcon}}}

%%% ZDS BOX
\newcommand{\newZdSBox}[3]{{%
   \theoremprework{~\\ \textcolor{#3}{\rule{0.6\linewidth}{1pt}}}
   \theorempostwork{\hfill \textcolor{#3}{\rule{0.6\linewidth}{1pt}} \\}
   \theoremindent=2em
   \theoremheaderfont{\scshape\hspace{-2em}}
   \theoremseparator{ ---}
   \theoremstyle{break}
   \theorembodyfont{\normalfont}
   \newtheorem*{#1}{\textcolor{#3}{#2}}
}}

\newcommand{\newZdSBoxEnvironment}[2]{%
   \newenvironment{#1}{~\\ \begin{minipage}{\linewidth}\begin{#2}}
                      {\end{#2}\end{minipage}}
}

\newZdSBox{IframeBox}{Élément externe}{iframeColor}

% Create box icon
\newcommand{\createBoxIcon}[2]{
   \begin{tikzpicture} %
   \fill (0, 0.5) [color=#1] \boxIcon; %
   \draw (0, 0.5) \boxIcon node[draw=none, text=white, text width=0.5cm, align=flush center] {\Large\sffamily$\boldsymbol{#2}$}; %
   \end{tikzpicture} %
}

%%% DEFAULT BOX THEME

\tcbsetforeverylayer{%
   enlarge top initially by=5mm,
   boxrule=0.5pt,
   breakable,
   enhanced,
   attach boxed title to top center={yshift=-2mm},
   arc=0.0pt
}

\newcommand{\newBox}[6]{%
\newtcolorbox{#1}{
colback=#2,
coltext=#3,
colframe=#4,
overlay={\node at (frame.north west) {\createBoxIcon{#5}{#6}};}
}%
}

\newBox{Success}{ZdSBoxBackgroundSuccess}{ZdSBoxForegroundSuccess}{ZdSBoxBorderSuccess}{ZdSBoxLogoBackgroundSuccess}{\checkmark}
\newBox{Information}{ZdSBoxBackgroundInformation}{ZdSBoxForegroundInformation}{ZdSBoxBorderInformation}{ZdSBoxLogoBackgroundInformation}{i}
\newBox{Question}{ZdSBoxBackgroundQuestion}{ZdSBoxForegroundQuestion}{ZdSBoxBorderQuestion}{ZdSBoxLogoBackgroundQuestion}{?}
\newBox{Warning}{ZdSBoxBackgroundWarning}{ZdSBoxForegroundWarning}{ZdSBoxBorderWarning}{ZdSBoxLogoBackgroundWarning}{!}
\newBox{Error}{ZdSBoxBackgroundError}{ZdSBoxForegroundError}{ZdSBoxBorderError}{ZdSBoxLogoBackgroundError}{\times}

%%% QUOTATION
\DeclareTColorBox{Quotation}{ o }{%
   blanker,
   before skip=6pt,after skip=6pt,
   borderline west={1mm}{0pt}{ZdSBoxBorderLeftQuotation},
   coltext=ZdSBoxForegroundQuotation,
   left=18pt,
   IfValueTF={#1}{after upper={\par\center\textit{#1}}}{}
}

%%% SPOILER
\newtcolorbox{SpoilerBox}{
   colback=ZdSBoxBackgroundSpoiler,
   coltext=ZdSBoxForegroundSpoiler,
   colframe=ZdSBoxBorderSpoiler,
   borderline south={2pt}{-2pt}{ZdSBoxBorderSpoiler}
}

%%% CODE MANAGEMENT
\tcbsetforeverylayer{} % Reset style

\setminted{breaklines, breaksymbolleft=\hspace{2em}, highlightcolor=highlightCodeColor, linenos, fontsize=\small,baselinestretch=1}

\DeclareTCBListing{CodeBlock}{O{}O{}O{1}m}{%
   enlarge top initially by=5mm,
   enlarge bottom finally by=1mm,
   boxrule=0.5pt,
   breakable,
   colback=codeBackgroundColor,
   coltext=defaultColor,
   colframe=ZdSBoxBorderSpoiler,
   arc=0.0pt,
   listing engine=minted,
   listing only,
   minted style=colorful,
   minted language=#4,
   minted options={highlightlines={#2}, firstnumber=#3,numbersep=3mm},
   enhanced,
   overlay={\begin{tcbclipinterior}\fill[lineNumberSeparatorCodeColor] ([xshift=8mm-0.5pt]frame.south west)
   rectangle ([xshift=8mm]frame.north west);\end{tcbclipinterior}},
   left=8mm,
   title=#1,
   attach boxed title to bottom center,
   boxed title style={empty,boxrule=0.5mm},
   coltitle=defaultColor
}

\DeclareTotalTCBox{\CodeInline}{ O{text} v }{%
   verbatim,
   colback=codeBackgroundColor,
   coltext=defaultColor,
   colframe=ZdSBoxBorderSpoiler,
   boxrule=0.5pt,
   arc=0.0pt
}
{\mintinline{#1}{#2}}

%%% IFRAMES
\newenvironment{Iframe}[1]{%
   ~\\ \begin{minipage}{\linewidth}\begin{IframeBox}[#1]
}{%
   \end{IframeBox}\end{minipage}
}

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

\newenvironment{Spoiler}{%
   \addtocounter{@spoilerCounter}{1}%
   \begin{xlrbox}{spoilerSavebox\the@spoilerCounter}\begin{minipage}{\linewidth}\begin{NoHyper}%
}{
   \vspace*{1em}\end{NoHyper}\end{minipage}\end{xlrbox}%
   \hypertarget{voir:\thepart\thechapter\the@spoilerCounter}{}
   \begin{SpoilerBox}
      \hyperlink{secret:\thepart\thechapter\the@spoilerCounter}{%
\color{ZdSBoxForegroundSpoiler}\spoilerIcon~Afficher le contenu masqué\color{defaultColor}}
   \end{SpoilerBox}
   \listgadd{\@spoilerList}{\xusebox{spoilerSavebox\the@spoilerCounter}}
}

\newcommand{\displaySpoilers}{%
   \setcounter{@spoilerCounter}{1}
   \ifdefvoid{\@spoilerList}{}{\levelSpoilerTitle{Blocs secrets}}
   \def\do{}
   \renewcommand{\do}[1]{%
      \levelSpoiler*{Secret \the@spoilerCounter}%
      \hypertarget{secret:\thepart\thechapter\the@spoilerCounter}{}
      \expandafter{##1}\\ \hfill \hyperlink{voir:\thepart\thechapter\the@spoilerCounter}{Retourner au texte.}
      \addtocounter{@spoilerCounter}{1}
   }
   \expandafter\dolistloop{\@spoilerList}
   \def\@spoilerList{}
   \setcounter{@spoilerCounter}{0}
}

\AtEndDocument{%
    \displaySpoilers
    \printglossary[title=Liste des abréviations]
}

%%% TITLE PAGE
\newcommand{\licence}[1]{\def\@licence{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\editor}[1]{\def\@editor{#1}}
\newcommand{\editorlogo}[1]{\def\@editorlogo{#1}}
\newcommand{\authorlink}[1]{\def\@authorlink{#1}}

\newcounter{@listSize}
\newcommand{\getListSize}[1]{%
   \setcounter{@listSize}{0}
   \renewcommand*{\do}[1]{\addtocounter{@listSize}{1}}
   \expandafter\docsvlist\expandafter{#1}
}

\newcommand{\formatAuthors}{%
   \setlength{\columnsep}{0pt}
   \newcounter{@authorsNumber}
   \newcounter{@authorsByColumn}
   \newcounter{@columnNumber}
   \setcounter{@authorsByColumn}{5}
   \getListSize{\@author}
   \setcounter{@authorsNumber}{\the@listSize}
   \setcounter{@columnNumber}{\the\numexpr(1 + \the@authorsNumber / \the@authorsByColumn)\relax}
   \thispagestyle{empty}
   \begin{flushright}
      \Large \bfseries \renewcommand*{\do}[1]{\href{\@authorlink/##1/}{\color{titlePageAuthorColor}\bsc{##1}}\\}
      \ifnum\the@authorsNumber < \the\numexpr(1+\the@authorsByColumn)
         \expandafter\docsvlist\expandafter{\@author}
      \else
         \begin{multicols}{\the@columnNumber}
            \expandafter\docsvlist\expandafter{\@author}
         \end{multicols}
      \fi
   \end{flushright}
}

\renewcommand{\maketitle}{%
   \ifcsdef{@authorlink}{}{\authorlink{https://zestedesavoir.com/membres/voir}}
   \ifcsdef{@website}{}{\website{https://zestedesavoir.com}}
   \ifcsdef{@editor}{}{\editor{https://zestedesavoir.com}}
   \ifcsdef{@editorlogo}{}{\editorlogo{zestedesavoir.png}}
   \ifcsdef{@logo}{}{\logo{default_logo.png}}
   \pagecolor{titlePageBackgroundColor}
   \color{titlePageTextColor}
   \clearpage
   \formatAuthors
   \begin{center}
      \vspace*{\fill}
      \includegraphics[max width=\textwidth, max height=4cm, keepaspectratio]{\@logo}\\
      \rule{\linewidth}{0.2 mm} \\[0.4 cm]
      \huge\textbf{\@title}\\
      \rule{\linewidth}{0.2 mm} \\[1 cm]
      \large\textbf{Ce tutoriel est sous licence \@licence}\\
      \vspace{\fill}
      \includegraphics[max width=8cm, max height=2cm, keepaspectratio]{\@editorlogo}\\
      \href{\@website}{\color{titlePageEditorColor}\@editor}
   \end{center}
   \newpage
   \newpagecolor{white}
   \color{black}
   \setcounter{page}{1}
}

\hypersetup{pdftitle={\@title}}
\hypersetup{pdfauthor={\@author}}

%%% IMAGES
\NewDocumentCommand{\image}{mo}{%
   \begin{center}
      \includegraphics[max size={\textwidth}{0.9\textheight}, keepaspectratio]{#1}
      \IfValueT{#2}{\captionof{figure}{#2}}
   \end{center}
}

\newcommand{\inlineImage}[1]{\includegraphics[max size={\textwidth}{\textheight}, keepaspectratio]{#1}}

%%% SMILEYS
\def\@smileysPath{./smileys}
\newcommand{\smileysPath}[1]{\def\@smileysPath{#1}}
\newcommand{\smiley}[1]{\raisebox{-3pt}{\includegraphics[height=15pt]{\@smileysPath/#1}} }

%%% HORIZONTAL LINE
\newcommand{\horizontalLine}{{\color{horizontalLineColor}\rule{\textwidth}{1.0pt}}}

%%% ABBREVIATIONS
\newcommand{\abbr}[2]{%
   \newglossaryentry{#1}{name=#1, description={#2}}%
   \dotuline{\gls{#1}}
}
