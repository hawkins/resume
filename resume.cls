% Intro Options
\ProvidesClass{resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=0.8cm, vmargin=0.4cm, includeheadfoot, headsep=1.5cm, footskip=0pt]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[english]{babel}
\usepackage[english]{isodate}
\usepackage{fontspec,xltxtra,xunicode}

% Color definitions
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Path = fonts/lato/]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}
\newcommand{\custombold}[1]{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Reg}\selectfont #1 \normalfont}

% Date command
\newcommand{\lastupdated}{
	\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont
	Last Updated
	\today
}

% Clearance command
\newcommand{\clearance}[1]{
	\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{12pt}{12pt}\selectfont
	Clearance:
	\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont\textbf{#1}
}

% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
		\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{30pt}{10cm}\selectfont #1
		\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
	} \\
	\centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #3}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{} {0em}{}

% Non-breaking headings command
\newcommand{\nbsection}[1]{\color{headings}
\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont\raggedright {#1} \normalfont}

% Subeadings command
\titleformat{\subsection}{\color{subheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{subheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{7pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}

% Header
\newcommand{\header}[0]{
	\thispagestyle{fancy}
	\fancyhead{}
	\fancyhead[L,C]{}
	\fancyhead[L]{\clearance{Top Secret}}
	\fancyhead[R]{\lastupdated}
	\fancyhead[C]{\namesection{Josh}{Hawkins}{
		%\urlstyle{same}\href{https://www.hawkins.is}{https://hawkins.is}
		%\textbullet{}
    Github:// \href{https://github.com/hawkins}{\bf hawkins}
		%\textbullet{} Twitter:// \href{https://twitter.com/hawkinjs}{\bf @hawkinjs}
		%\textbullet{} LinkedIn://  \href{https://www.linkedin.com/in/hawkinsjosh}{\bf hawkinsjosh}
		\\
		Email:// \href{mailto:hawkinswritescode@gmail.com}{\bf hawkinswritescode@gmail.com}
	}}
	\fancyfoot[C]{} % Prevent page numbers
	\renewcommand{\headrulewidth}{0.4pt}
}
