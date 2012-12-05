%-----------------------------------------------------------------------
% isg-thesis LaTeX class
% 
% Created by Marcelo Carlomagno Carlos <contact@marcelocarlos.com>
% Based on a version created by Saif Al-Kuwari <Saif.Alkuwari.2008@live.rhul.ac.uk>
% 
% website: https://github.com/marcelocarlosbr/isg-thesis
%-----------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isg-thesis} [2012/10/10]

\LoadClass[11pt,a4paper]{report} % Regulations: A4 size paper (210 x 297 mm) should be used

%----------------------------------------------------
% Required Packages
%----------------------------------------------------
\RequirePackage[english]{babel} 
\RequirePackage{setspace}
\RequirePackage{color}              % coloured text and background
\RequirePackage[svgnames]{xcolor}   % colour extensions (adding svgnames support)
\RequirePackage[breaklinks,pagebackref,bookmarks]{hyperref}           % hyperlinks in cross references
\RequirePackage[normalem]{ulem}     % strikethrough
\usepackage{soul}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{type1cm}
\RequirePackage{fancyhdr}

%----------------------------------------------------
% Other Packages
%----------------------------------------------------
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}

\usepackage{amsfonts}           % fonts from the American Mathematical Society. 

\usepackage{verbatim}
\usepackage{listings}

%----------------------------------------------------
% Package settings
%----------------------------------------------------
\hypersetup{ colorlinks, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black }  

%----------------------------------------------------
% Class options
%----------------------------------------------------
% Highlight links - good for pdf reading
\DeclareOption{pdf}{ \hypersetup{ linkcolor=blue, citecolor=blue, urlcolor=blue, colorlinks=true} }
% Display watermark
\DeclareOption{watermark}{
    \AddToShipoutPicture{%
		\setlength{\@tempdimb}{.5\paperwidth}%
		\setlength{\@tempdimc}{.5\paperheight}%
		\setlength{\unitlength}{1pt}%
		\put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
			\makebox(0,0){\rotatebox{55}{\textcolor[gray]{0.96}%
			{\fontsize{5.5cm}{5.5cm}\selectfont{DRAFT}}}}%
		}%
    }
}
% show / hide header
\newif\ifheader
\headertrue
\DeclareOption{noheader}{\headerfalse}
% show / hide footer rule
\newif\iffooterrule
\footerruletrue
\DeclareOption{nofooterrule}{\footerrulefalse}
% process the options
\ProcessOptions

%----------------------------------------------------
% Formatting
%----------------------------------------------------
% Regulations: Margins at the binding edge must be not less than 40 mm (1.5 inches) and other margins not less than 20 mm (0.75 inches)
\oddsidemargin 15mm 
\evensidemargin 0pt	 
\textwidth 5.7in
\textheight 234mm
\topmargin 0in
\headheight 20pt                
\textheight 8.5in                     
\headsep \headheight
\footskip .4in

% Regulations: Double or one-and-a-half spacing should be used in typescripts, except for indented quotations or footnotes, where single spacing may be used. 
% We are adopting one-and-a-half spacing as default here
\onehalfspacing


%----------------------------------------------------
% Macros
%----------------------------------------------------
% degree name
\def\degree#1{\gdef\@degree{#1}}

% degree year
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% subtitle
%\def\subtitle#1{\gdef\@subtitle{#1}}

%----------------------------------------------------
% Commands
%----------------------------------------------------
% we will use the following later in producing the the declaration page
% command to produce dotted lines of fixed length
\newcommand{\dotrule}[1]{\parbox[t]{#1}{\dotfill}}
% this command will produce the titles for abstract, acknowledgments and dedication
\newcommand{\titleenvironment}[1]{{\begin{center}\bf{\Large\noindent#1\vspace{.8cm}}\end{center}}}
% multi-line comments
\newcommand{\multicomment}[1]{}  
% centralised note in a new line for review
\newcommand{\revcomment}[2][red] {\begin{center}{\color{#1}{[#2]}}\end{center}}  
% inline note for review
\newcommand{\incomment}[2][red] {{\color{#1}{[#2]}}}  
% strikethroughed text to highlight removed portions of a text during the review
\newcommand{\rmtext}[2][olive] {{\color{#1}{\sout{[#2]}}}}  
% highlights a portion of text
\newcommand{\newtext}[2][GreenYellow] {\sethlcolor{#1}\hl{\textit{#2}}}  

%----------------------------------------------------
% Title Page
%----------------------------------------------------
%regulations state: The title page must bear the officially-approved title of the thesis, the candidate's full name as registered, the name of the Royal Holloway College and the degree for which it is submitted.
\def\maketitle{
  \begin{titlepage}
     \thispagestyle{empty}
     
     \centering
     \begin{minipage}{9cm}
     \end{minipage}
     
     \vspace{1.5 cm}
          
     \large
     \def\baselinestretch{1.2}
     {\def\baselinestretch{1.2}\huge\bf \@title \par}
     %{\def\baselinestretch{1.2}\Large\@subtitle \par}
     \vspace{3.5 cm}
          
     \text{{\Large \@author}}\vspace{6.5 cm}
     
     \text{\normalsize Thesis submitted to}\vspace{0.15 cm}
     
     \text{\large Royal Holloway, University of London}\vspace{0.15 cm}
     
     \text{\normalsize for the degree of}\vspace{0.15 cm}
     
     \text{\large \@degree}
     
     \vfill
     \@degreeyear
  \end{titlepage}
  \setcounter{page}{2}
}


%----------------------------------------------------
% Declaration
%----------------------------------------------------
\def\declaration{  
  {\pagestyle{plain}
  \titleenvironment{Declaration}
  
  \noindent I, \@author, hereby declare that this thesis and the work presented in it is entirely my own. Where I have consulted the work of others, this is always clearly stated.
  
  \vspace{2cm}
  
  \begin{center}
    Signed: \dotrule{8cm} \\
    (\@author) \\
    \vspace{.8cm}
    Date: \dotrule{4cm}  
  \end{center}
  
  \clearpage}
}

%----------------------------------------------------
% Dedication, Abstract and Acknowledgement environments
%----------------------------------------------------
% dedication
\newenvironment{dedication} {\pagestyle{plain}\begin{minipage}{1in}\end{minipage}\vspace{2in}\begin{center}\it} {\end{center}\clearpage}
% acknowledgement
\newenvironment{acknowledgement} {\pagestyle{plain}\titleenvironment{Acknowledgement}\noindent\ignorespaces}{\clearpage}
% abstract
\renewenvironment{abstract} {\pagestyle{plain}\titleenvironment{Abstract}\noindent\ignorespaces} {\clearpage}

%----------------------------------------------------
% Header and Footer
%----------------------------------------------------
\ifheader
  % custom header package
  \pagestyle{fancy}
  % defining header
  \fancyhead[R]{\slshape \small{\nouppercase{\rightmark}}}
  \fancyhead[L]{\slshape \small{\nouppercase{\leftmark}}}  
  %\fancyhead[LE,RO]{\slshape \small{\nouppercase{\rightmark}}} % this works only if the class has the option twoside
  %\fancyhead[LO,RE]{\slshape \small{\nouppercase{\leftmark}}} % this works only if the class has the option 
  \renewcommand{\headrulewidth}{.01pt}
  % defining footer
  \fancyfoot[C]{\thepage}
  %\renewcommand{\footrulewidth}{.1pt}  % draw a line splitting the footer and the contents
\fi
