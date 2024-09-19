\NeedsTeXFormat{LaTeX2e}

\LoadClass[12pt,a4paper]{article}
\usepackage{enumitem}
\usepackage[top=0.75cm,bottom=0.75cm,right=1.00cm,left=1.00cm]{geometry}
\usepackage{ctex}

\setmainfont{Source Han Sans CN}
\setsansfont{Source Han Sans CN}
\setmonofont{Source Han Sans CN}
\setCJKmainfont{Source Han Sans CN}
\setCJKsansfont{Source Han Sans CN}
\setCJKmonofont{Source Han Sans CN}

\setlength{\parindent}{0em}
\setlist{nosep,left=0em,labelindent=5pt,labelwidth=1.25em}

% 字体大小
% \tiny
% \scriptsize
% \footnotesize
% \small
% \normalsize
% \large
% \Large
% \LARGE
% \huge
% \Huge

\newcommand{\@name}[1]{Your Name}
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\def \makename {\huge\textbf\@name}

\newcommand{\@position}[1]{Your Position}
\newcommand{\position}[1]{\renewcommand{\@position}{#1}}
\def \makeposition {\large\@position}

\def \makepersonalinfo{
    \begin{minipage}{0.5\textwidth}
        \centering\makename\\\makeposition
    \end{minipage}
}

\newcommand*\@contacts{}
\newcommand*\contact[1]{
    \ifx\features\empty {\def\features{\par#1}}
    \else {\g@addto@macro\@contacts{\par#1}}
    \fi
}
\def \makecontact{\llap{\parbox{\textwidth}{\small\raggedleft\@contacts}}}

\def \makeheader{
    \makebox[\textwidth]{
        \hfill
        \makepersonalinfo
        \hfill
        \makecontact
    }
}

\newenvironment{ResumeSection}[1]{
    \MakeUppercase{\bf\Large #1}
    \smallskip\hrule\medskip
}{
    %\bigskip
}

\define@key{work}{org}{\def\work@org{#1}}
\define@key{work}{location}{\def\work@location{#1}}
\define@key{work}{position}{\def\work@position{#1}}
\define@key{work}{duration}{\def\work@duration{#1}}
\newenvironment{ResumeSubsection}[1]{
    \setkeys{work}{org=,location=,position=,duration=}
    \setkeys{work}{#1}
    \smallskip
    \ifx\work@org\empty {}
    \else {\par\normalsize\textbf\work@org\hfill\normalsize\work@location\par}
    \fi
    \ifx\work@position\empty {}
    \else {\par\normalsize\work@position\hfill\normalsize\work@duration\par}
    \fi
    \smallskip
}{
    \bigskip
}

\define@key{project}{org}{\def\project@org{#1}}
\newenvironment{ResumeProject}[1]{
    \setkeys{project}{org=}
    \setkeys{project}{#1}
    \smallskip
    \par\normalsize\textbf\project@org
}{
    \bigskip
}
