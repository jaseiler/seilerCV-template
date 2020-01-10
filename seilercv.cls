\LoadClassWithOptions{article}  % build on standard article class
 
\usepackage[absolute,overlay]{textpos}
\usepackage[colorlinks]{hyperref}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{parskip}

%\usepackage{Rosario}
%\usepackage[default]{sourcesanspro}
%\usepackage{tgheros}
%\usepackage{cmll}
%\usepackage[defaultsans]{droidsans}
\usepackage{carlito}
\renewcommand{\familydefault}{\sfdefault}
\definecolor{darkblue}{HTML}{2C365B}
\definecolor{darkishblue}{HTML}{36457E}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=darkishblue
}

\setlength{\topmargin}{-0.3in}
\setlength{\oddsidemargin}{-0.1in}
\setlength{\evensidemargin}{0in}
\setlength{\textwidth}{6.5in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\topskip}{0.3in}
\setlength{\textheight}{9.3in}

\setcounter{secnumdepth}{0}
 
%%%%%%%%%%
% Header 	   %
%%%%%%%%%%
%\newcommand*{\email}[1]{\def\@email{#1}}
\usepackage{tikz}
\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=lightgray, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      %\fontsize{40pt}{72pt}\color{gray}%     
      {\Huge\color{darkblue} #1} \textbf {\Huge\color{darkgray}#2}\textbf{\Huge\color{darkblue}#3}\vspace{-2.5cm} 
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{24pt}{48pt}\color{white}%
     {\Large #4}%
    };
     \node[anchor=south] at (box.south){
    };
     \end{tikzpicture}
  \vspace{1.5cm}
  \vspace{-4\parskip}
}


%%%%%%%%%%
%Aside 		    %
%%%%%%%%%%

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \vspace{\baselineskip}{\Large\color{darkblue} ##1}
  }
  \begin{textblock}{3.6}(1.0, 1.93)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%
%Section		    %
%%%%%%%%%%
\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\color{darkblue}%
    #1%
  }
  \par\vspace{-0.1em}
}

%%%%%%%%%%
%Subsection	    %
%%%%%%%%%%
\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

%%%%%%%%%%
%Entry List	    %
%%%%%%%%%%
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

%%%%%%%%%%
%Entry 		    %
%%%%%%%%%%
\usepackage{changepage} 
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize #3}\\%\addfontfeature{Color=lightgray} 
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%
%Job		    %
%%%%%%%%%%
\newcommand{\job}[3]{
{\small{\makebox[-0.25in][10pt]{} \textit{#1} \hfill \textbf{#2} \\*  {#3}\vspace{.8em}\\* } }}
%\bigskip\hspace{.2in}  {{#4}: }\href{mailto:{#5}}{#5}\\*}

\defaultfontfeatures{
    Path = /usr/local/texlive/2013/texmf-dist/fonts/opentype/public/fontawesome/ }
\usepackage{fontawesome}

%\renewcommand{\bfseries}{\color{darkgray}}
\DeclareTextFontCommand{\bf}{\color{darkgray}\bfseries}
%\DeclareTextFontCommand{\textbf}{\color{darkgray}\bfseries}

% one address
\def\address#1{{\centering #1\par}}
 
% two addresses (say, home and work).They get printed side by side  
\def\addresses#1#2{\hbox to \hsize{\hspace{0.5in}\@tablebox{#1}\hfil\@tablebox{#2}}}
 
\def\@tablebox#1{\begin{tabular}[t]{@{}l@{}}#1\end{tabular}}
 
\newbox\@title
 
% Most of the CV goes inside a llist environment.  Within it, use
% the \sectiontitle{title} command to begin new sections.  The title
% of the section is put in the left margin.  The section text begins
% on the next line if the sectiontitle is too long.
 
\newenvironment{llist}{\begin{list}{}{\setlength
 \labelwidth{0.5in}\setlength\leftmargin{\labelwidth}\addtolength
 \leftmargin{\labelsep}\itemsep 5pt plus 2pt minus 2pt
 \parsep 10pt plus 2pt minus 2pt
 %% Set the depth of the title to 0 in case more than one line.
 %% If the title takes more lines than the body, you lose.
 \def\sectiontitle##1{\setbox\@title=\hbox{{\bf\@tablebox{##1}}}\dp\@title=0pt
   \item[\copy\@title]\ifdim\wd\@title>\labelwidth
   \leavevmode \\* \else \fi}
 \def\makelabel##1{##1\hfill}}}{\end{list}}
 
% like itemize but bullets are at the left margin
\newenvironment{items}{\begin{list}{$\bullet$}
  {\setlength\labelwidth{.5em}\setlength\leftmargin{1em}
  \def\makelabel##1{##1\hfill}}}{\end{list}}
 
% Use the \employer and \location commands to print the names and
% cities of your employers.  \employer always starts a new paragraph,
% and should be followed by \location.
%
% \employer* is like \employer but is used for additional information
% about the employer.  It does NOT start a new paragraph, must
% NOT be followed by \location, and always forces a new line after itself.
\def\employer{\@ifstar{\@semployer}{\@employer}}
\def\@employer#1{\par{\sc #1}}
\def\@semployer#1{{\sc #1}}
 
% The location is always flush right.  It is moved to the next
% line if there is not room left on this one.  
% See the TeXbook Chapter 14.
\def\location#1{{\unskip\nobreak\hfill\penalty50\hskip2em
  \hbox{}\nobreak\hfill \hbox{#1}\finalhyphendemerits=0 \\}}

\def\locationtwo#1{{\unskip\nobreak\hfill\penalty50\hskip2em
  \hbox{}\nobreak\hfill \hbox{#1}\finalhyphendemerits=0 }}
 
% This prints the date flush left.
% The major shortcoming of this file:
% There needs to be an option to print the date in the left margin,
% because many people like to do it that way.
\def\dates#1{#1\\[2pt]}
