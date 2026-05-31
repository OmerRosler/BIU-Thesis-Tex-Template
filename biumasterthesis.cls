\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{biumasterthesis}[BIU Master Thesis Class]

% Options
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

% Load the base class
\LoadClass{article}

\RequirePackage{etoolbox}

% Require hyperref in the end
\AtEndPreamble{
	\RequirePackage{hyperref} % For phantomsection
}

\RequirePackage[nottoc]{tocbibind}
\RequirePackage{polyglossia} % To use hebrew
\RequirePackage{fontspec} % To control hebrew fonts
\RequirePackage{setspace} % To control line spacing

% Package logic

% TODO: Document each feature separately. There is a tool in latex to document classes: use .dtx file instead of .cls. We run it using a tool called DocStrip with the package doc (or something more new). This way we autogenerate docs.
% Add abstract to TOC
% Save the original abstract environment behavior
\let\oldabstract\abstract
\let\endoldabstract\endabstract

% Redefine it to handle TOC injection AND page numbering flips
\renewenvironment{abstract}{
	\clearpage                    % Ensure numbering changes happen on a fresh page
	\pagenumbering{roman}         % Switch page numbers to i, ii, iii...
	\phantomsection
	\addcontentsline{toc}{section}{\abstractname}
	\oldabstract
}{
	\endoldabstract
	\clearpage
	\pagenumbering{arabic}
}

% TODO: Document that if we view the page number in an external pdf viewer, it still shows it with english numerals (I don't know if this can be fixed)
% Define hebrew page numbering layout
% Adapted from a Stack Overflow answer by user 'John Kormylo'
% Source: https://tex.stackexchange.com/a/303111/442136
% Licensed under CC-BY-SA 3.0
\makeatletter
\def\ps@hebrew{%
	\let\@oddhead\relax
	\let\@evenhead\relax
	\def\@oddfoot{\hfill\begin{otherlanguage}{hebrew}%
			\hebrewnumeral{\arabic{page}}%
		\end{otherlanguage}\hfill}%
	\let\@evenfoot\@oddfoot}
\makeatother

% Add the hebrew numbered section to TOC
% Adapted from a Stack Overflow answer by user 'user2679290'
% Source: https://tex.stackexchange.com/a/617122/442136
% Licensed under CC-BY-SA 4.0
% It does three things: 
% 1. Replace \thepage with the letter aleph (we need robustify as this is not run directly)
% 2. Adds a section to the TOC with this aleph as page number (and correct link as we use the hyperref version of \addcontentsline)
% 3. Restore \thepage to its last value (we assume the location we called the command is just before the abstract and have alph pagenumbering)
\newcommand{\addhebrewtoctitle}[1]{\robustify{\thepage}
	\addtocontents{toc}{\protect\renewcommand\thepage{\texthebrew{\protect\hebrewnumeral{1}}}}
	\addcontentsline{toc}{section}{#1}
	\addtocontents{toc}{\protect\renewcommand\thepage{\alph{page}}}}


% Hebrew abstract enviroment with custom handling of page numbering and TOC
\newenvironment{hebrewabstract}{
	\clearpage
	\pagenumbering{alph}
	\pagestyle{hebrew}
	\phantomsection\label{sec:hebrew_abstract}
	\addhebrewtoctitle{Hebrew Abstract} 
	
	% Open the language block
	\begin{otherlanguage}[numerals=hebrew]{hebrew}
		\section*{תקציר}
	}{
		% Close the language block
	\end{otherlanguage}
	\clearpage
}

% TODO: Debug why this never runs. there is a stackoverflow answer for debugging who edits maketitle
\makeatletter
\renewcommand{\maketitle}{$ ( $)}
\makeatother


% The [optional] acknowlegement page
\makeatletter

\def\@acktext{}
\newcommand{\acktext}[1]{%
	\def\@acktext{#1}%
}

\newcommand{\makeackpage}{%
	\clearpage
	\pagenumbering{gobble}
	\thispagestyle{empty}
	\textbf{Acknowledgments}\\
	\@acktext
	\clearpage
	\pagenumbering{arabic}
}

% The english advisors page
\makeatletter

\def\@advisorstext{}
\newcommand{\advisorstext}[1]{%
	\def\@advisorstext{#1}%
}

\newcommand{\makeadvisorspage}{%
	\clearpage
	\pagenumbering{gobble}
	\thispagestyle{empty}
	
	\vspace*{\fill}
	\begin{center}
		\@advisorstext
	\end{center}
	\vspace*{\fill}
	
	\clearpage
	\pagenumbering{arabic}
	
	% Track that the user called this command entirely in memory
	\gdef\BIU@advisorspage@compiled{1}%
}

\makeatother


% The hebrew advisors page
\makeatletter

\def\@advisorstextheb{}
\newcommand{\advisorstextheb}[1]{%
	\def\@advisorstextheb{#1}%
}

\newcommand{\makehebadvisorspage}{%
	\pagestyle{plain}
	\pagenumbering{gobble}
	
	
	% Advisor page in hebrew
	\begin{otherlanguage}{hebrew}
		\begin{center}
			\vspace*{\fill}
			\@advisorstextheb
			\vspace*{\fill}
		\end{center}
	\end{otherlanguage}
	
	\clearpage
	\pagenumbering{arabic}
	
	% Track that the user called this command entirely in memory
	\gdef\BIU@hebadvisorspage@compiled{1}%
}

\makeatother

% The hebrew cover page

\makeatletter
\def\@qualificationtext{}
\newcommand{\qualificationtext}[1]{%
	\def\@qualificationtext{#1}%
}

\def\@qualificationtextheb{}
\newcommand{\qualificationtextheb}[1]{%
	\def\@qualificationtextheb{#1}%
}

\def\@titleheb{}
\newcommand{\titleheb}[1]{%
	\def\@titleheb{#1}%
}

\def\@authorheb{}
\newcommand{\authorheb}[1]{%
	\def\@authorheb{#1}%
}
\newcommand{\makehebcoverpage}{%
\begin{otherlanguage}{hebrew}
	\pagestyle{plain}
	\pagenumbering{gobble}	
	% Hebrew cover page
	\newpage
	
	\begin{center}		אוניברסיטת בר אילן\\
		\vspace*{3cm}
		\textbf{\Large \@titleheb}
		\vspace{2cm}
		
		\vspace{2.5cm}
		
		\textbf{\@authorheb}
		
		\vspace{1cm}
		\@qualificationtextheb
		
		\vspace*{\fill}
		\textbf{רמת גן}
		\hfill
		% TODO: Extract year from date metadata (which can be overriden by the user)
		\textbf{תשפ"ה}
	
\end{center}
\end{otherlanguage}
	% Track that the user called this command entirely in memory
	\gdef\BIU@hebcoverpage@compiled{1}%
}

\makeatother

% Disable page numbering on Bibliography page
\makeatletter
% TODO: Reconsider how this is implemented: if the class is used with multiple TOCs (for example when using an article based thesis, this applies to all of them). Maybe add a command that wraps the bib creation?
% Before the Table of Contents executes
\pretocmd{\tableofcontents}{%
	\clearpage
	% Save the current page counter value into a temporary macro
	\edef\BIU@savedpage{\the\value{page}}%
	% swallow all page numbers natively
	\pagenumbering{gobble}%
}{}{}

% After the Table of Contents finishes
\apptocmd{\tableofcontents}{%
	\clearpage
	% Reactivate Arabic page numbers for the rest of the thesis body
	\pagenumbering{arabic}%
	% Restore the exact page counter value
	\setcounter{page}{\BIU@savedpage}%
}{}{}

\makeatother


\makeatletter
% Single-pass enforcement checks at the end of the document: these validate we called the commands that create the custom pages (but not their correct order)
\AtEndDocument{
	\ifdefined\BIU@advisorspage@compiled
	\else
	\ClassError{biumasterthesis}{Missing \string\makeadvisorspage}{%
		The university requires an advisors page.\MessageBreak
		Please place \string\makeadvisorspage\space exactly where it belongs in your layout.%
	}
	\fi
	\ifdefined\BIU@hebadvisorspage@compiled
	\else
	\ClassError{biumasterthesis}{Missing \string\makehebadvisorspage}{%
		The university requires an advisors page in the hebrew.\MessageBreak
		Please place \string\makehebadvisorspage\space exactly where it belongs in your layout.%
	}
	\fi
	\ifdefined\BIU@hebcoverpage@compiled
	\else
	\ClassError{biumasterthesis}{Missing \string\makehebcoverpage}{%
		The university requires a hebrew cover page.\MessageBreak
		Please place \string\makehebcoverpage\space exactly where it belongs in your layout.%
	}
	\fi

}

\makeatother

