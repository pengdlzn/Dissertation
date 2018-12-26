%% 
%% File: wup.cls
%% An open source Univerity Press LaTeX class by Herbert Baier and Kristina Hanig
%%
%% Version: 1.1 (August 23, 2017)
%% 
%% Copyright by Herbert Baier (baier@itbaier.de)
%%              Kristina Hanig (kristina.hanig@gmx.de)
%%
%% Free to use for scientific purpose as long as the proper credits are
%% given to the original authors.
%% For other purposes, please contact the authors.

\NeedsTeXFormat{LaTeX2e}[1994/12/01]% LaTeX date must be December 1994 or later
\ProvidesClass{wup}[2017/08/23 v1.1 WUP class]

%--------------------------------------------------
% Required packages:
%   geometry
%   MinionPro or (charter and helvet)
%   microtype
%   graphicx or epsfig
%   fancyhdr
%   titlesec
%   caption
%   subcaption
%--------------------------------------------------

%------------------
% Defines variables
%------------------

\newif\if@pageSizeSmall         % Set the page size to 155x220 mm
\newif\if@pageSizeMedium        % Set the page size to 170x240 mm
\newif\if@pageSizeLarge         % Set the page size to A4

\newif\if@wupFont               % Use WUP default font MinionPro and MyriadPro
\newif\if@alternativeFont       % Use WUP default font Charter and Helvetica

\newif\if@headLine              % Use head line style

\newif\if@dissertation          % Use dissertation style

\newif\if@halfTitlePage         % Prints the half-title page
\newif\if@titlePage             % Prints the title page
\newif\if@imprintPage           % Prints the imprint page
\newif\if@dedicationPage        % Prints the dedication page
\newif\if@acknowledgmentsPage   % Prints the acknowledgments page
\newif\if@prefacePage           % Prints the preface page
\newif\if@abstractPage          % Prints the abstract page
\newif\if@tableOfContentsPage   % Prints the table of contents page

\newif\if@graphicx				% Loads the package graphicx for images
\newif\if@epsfig				% Loads the package epsfig for images

\newlength{\length@titles}

%--------------------------------------------------
% Options of WUP class
% Page size
%	pagesize155x220
%   pagesize170x240 (default)
%   pagesizeA4
%
% Font
%   wupfont (default)
%   alternativefont
%
% Layout
%   [no]headline (default noheadline)
%		Use head line style
%
% Style
%   [no]dissertation (default dissertation)
%
% Languages
%   english (default)
%   german
%
% Page options front matter
%   allfrontmatter
%       prints all front matter pages
%   nofrontmatter
%       does not print the front matter pages
%	[no]halftitle (default halftitle)
%		prints the half-title page
%	[no]title (default title)
%		prints the title page
%	[no]imprint (default imprint)
%		prints the imprint page
%	[no]dedication (default nodedication)
%		prints the dedication page
%	[no]acknowledgments (default noacknowledgments)
%		prints the acknowledgments page
%	[no]preface (default preface)
%		prints the preface page
%	[no]abstract (default noabstract)
%		prints the abstract page
%	[no]tableofcontents (default tableofcontents)
%		prints the table of contents page
%
% Graph package options
%		nographic
%			does not load graphic packages
%		graphicx (default)
%			loads the package graphicx for images
%		epsfig
%			loads the package epsfig for images
%--------------------------------------------------

\DeclareOption{pagesize155x220}{%
	\@pageSizeSmalltrue%
	\@pageSizeMediumfalse%
	\@pageSizeLargefalse%
	\PassOptionsToClass{10pt}{book}
	
	\setlength{\length@titles}{105mm}
}
\DeclareOption{pagesize170x240}{%
	\@pageSizeSmallfalse%
	\@pageSizeMediumtrue%
	\@pageSizeLargefalse%
	\PassOptionsToClass{10pt}{book}
	
	\setlength{\length@titles}{120mm}
}
\DeclareOption{pagesizeA4}{%
	\@pageSizeSmallfalse%
	\@pageSizeMediumfalse%
	\@pageSizeLargetrue%
	\PassOptionsToClass{11pt}{book}
	
	\setlength{\length@titles}{157mm}
}

\DeclareOption{wupfont}{%
	\@wupFonttrue%
	\@alternativeFontfalse%
}
\DeclareOption{alternativefont}{%
	\@wupFontfalse%
	\@alternativeFonttrue%
}

\DeclareOption{headline}{\@headLinetrue}
\DeclareOption{noheadline}{\@headLinefalse}

\DeclareOption{dissertation}{\@dissertationtrue}
\DeclareOption{nodissertation}{\@dissertationfalse}

\DeclareOption{english}{%
	\def\the@dedicationLabel{Dedication}
	\def\the@acknowledgmentsLabel{Acknowledgments}
	\def\the@prefaceLabel{Preface}
	\def\the@abstractLabel{Abstract}
}
\DeclareOption{german}{%
	\def\the@dedicationLabel{Widmung}
	\def\the@acknowledgmentsLabel{Danksagung}
	\def\the@prefaceLabel{Vorwort}
	\def\the@abstractLabel{Zusammenfassung}
}

\DeclareOption{allfrontmatter}{
	\@halfTitlePagetrue
	\@titlePagetrue
	\@imprintPagetrue
	\@dedicationPagetrue
	\@acknowledgmentsPagetrue
	\@prefacePagetrue
	\@abstractPagetrue
	\@tableOfContentsPagetrue
}
\DeclareOption{nofrontmatter}{
	\@halfTitlePagefalse
	\@titlePagefalse
	\@imprintPagefalse
	\@dedicationPagefalse
	\@acknowledgmentsPagefalse
	\@prefacePagefalse
	\@abstractPagefalse
	\@tableOfContentsPagefalse
}
\DeclareOption{halftitle}{\@halfTitlePagetrue}
\DeclareOption{nohalftitle}{\@halfTitlePagefalse}
\DeclareOption{title}{\@titlePagetrue}
\DeclareOption{notitle}{\@titlePagefalse}
\DeclareOption{imprint}{\@imprintPagetrue}
\DeclareOption{noimprint}{\@imprintPagefalse}
\DeclareOption{dedication}{\@dedicationPagetrue}
\DeclareOption{nodedication}{\@dedicationPagefalse}
\DeclareOption{acknowledgments}{\@acknowledgmentsPagetrue}
\DeclareOption{noacknowledgments}{\@acknowledgmentsPagefalse}
\DeclareOption{preface}{\@prefacePagetrue}
\DeclareOption{nopreface}{\@prefacePagefalse}
\DeclareOption{abstract}{\@abstractPagetrue}
\DeclareOption{noabstract}{\@abstractPagefalse}
\DeclareOption{tableofcontents}{\@tableOfContentsPagetrue}
\DeclareOption{notableofcontents}{\@tableOfContentsPagefalse}

\DeclareOption{graphicx}{%
	\@graphicxtrue%
	\@epsfigfalse%
}
\DeclareOption{epsfig}{%
	\@graphicxfalse%
	\@epsfigtrue%
}
\DeclareOption{nographic}{%
	\@graphicxfalse%
	\@epsfigfalse%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{twoside,pagesize170x240,wupfont,noheadline,dissertation,english,halftitle,title,imprint,nodedication,noacknowledgments,preface,noabstract,tableofcontents,graphicx}
\ProcessOptions

%----------------------
% Load the father class
%----------------------
\LoadClass{book}[1994/12/09]

%---------
% Packages
%---------

% Page size package
\if@pageSizeMedium
	\RequirePackage[paperwidth=17cm,paperheight=24cm,top=2.5cm,bottom=2.5cm,inner=2.2cm,outer=2cm]{geometry}
\else
	\if@pageSizeSmall
		\RequirePackage[paperwidth=15.5cm,paperheight=22cm,top=2.5cm,bottom=2.5cm,inner=2.2cm,outer=2cm]{geometry}
	\else
		% This is page size A4
		\RequirePackage[paperwidth=21cm,paperheight=29.7cm,top=3.5cm,bottom=2.5cm,inner=2.7cm,outer=2.3cm]{geometry}
	\fi
\fi

% Font packages
\if@wupFont
	\RequirePackage[openg,lf]{MinionPro}
	\renewcommand{\sfdefault}{Myriad-LF}
\else
	\RequirePackage{charter}
	\RequirePackage[scaled=.90]{helvet}
\fi

\RequirePackage[final]{microtype}

% Graphic package
\if@graphicx
%	\RequirePackage[final]{graphicx} %Dongliang's change, we have \RequirePackage{tikz} at the very beginning
	\graphicspath{{images/}}
	\newcommand{\printLogo}{\includegraphics[height=1cm]{WUPlogo_titlepage}}
	\newcommand{\printByNcNd}{\includegraphics[height=5mm]{by-nc-nd_eu}}
	\newcommand{\printBySa}{\includegraphics[height=5mm]{by-sa}}
\else
	\if@epsfig
		\RequirePackage{epsfig}
		\graphicspath{{images/}}
		\newcommand{\printLogo}{\epsfig{file=WUPlogo_titlepage,height=1cm}}
		\newcommand{\printByNcNd}{\epsfig{file=by-nc-nd_eu,height=5mm}}
		\newcommand{\printBySa}{\epsfig{file=by-sa,height=5mm}}
	\else
		\newcommand{\printLogo}{}
		\newcommand{\printByNcNd}{}
		\newcommand{\printBySa}{}
	\fi
\fi

% Set head layout

\RequirePackage{fancyhdr}

\if@headLine
	\fancyhf{}
	\fancyhead[RE]{\ifnum\value{chapter}>0 \textsf{\nouppercase{\leftmark}} \fi}
	\fancyhead[LO]{\ifnum\value{chapter}>0 \textsf{\nouppercase{\rightmark}} \fi}
	\fancyhead[LE,RO]{\textsf{\thepage}}
	\fancyfoot[L,R,C]{}
	\renewcommand{\headrulewidth}{0.4pt}
\else
	\fancyhf{}
	\fancyhead[LE]{\ifnum\value{chapter}>0 \textit{\nouppercase{\leftmark}} \fi}
	\fancyhead[RO]{\ifnum\value{chapter}>0 \textit{\nouppercase{\rightmark}} \fi}
	\fancyfoot[LE,RO]{\textsf{\thepage}}
	\renewcommand{\headrulewidth}{0pt} 
\fi

% Remove headers and footers for pages between chapters
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else\hbox{}%
	\thispagestyle{empty}%
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% Style of Chapters and Sections
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \if@headLine\thispagestyle{empty}\fi%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
                    
\RequirePackage{titlesec}

\titleformat{\chapter}[display]{\normalfont\sffamily\huge\bfseries}{%
	\chaptertitlename\ \thechapter}{8pt}{}
\titlespacing*{\chapter}{0pt}{*2}{*3}

\titleformat{\section}{\normalfont\sffamily\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\sffamily\large\bfseries}{\thesubsection}{1em}{}

% Updated the bibliography environment to use appropriated marks and add entry
% in the table of contents
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
%     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addMarkChapterStar{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist
      }

% Style of Captions
\RequirePackage[labelfont={bf,sf},textfont={sf},font=footnotesize,justification=raggedright,singlelinecheck=false]{caption}
\RequirePackage[indention=.0cm,labelfont={bf,sf},textfont=normalfont,justification=raggedright,font=footnotesize,singlelinecheck=false]{subcaption}

% Defines page style plain to use numbering outer foot
\renewcommand*{\ps@plain}{%
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \def\@oddfoot{%
    %\reset@font
    \hfil
    {\sffamily{\thepage}}
   }%
  \let\@evenhead\@empty
  \def\@evenfoot{%
    %\reset@font
     {\sffamily{\thepage}}
   }%
}


%
% WUP defaults information
%
\newif\if@titleHalf \@titleHalffalse
\newcommand{\TitleHalf}[1]{\@titleHalftrue \def\command@titleHalf{#1}}
\newif\if@title \@titlefalse
\newcommand{\Title}[1]{\@titletrue \def\command@title{#1}}
\newif\if@subTitle \@subTitlefalse
\newcommand{\SubTitle}[1]{\@subTitletrue \def\command@subTitle{#1}}
\newif\if@author \@authorfalse
\newcommand{\Author}[1]{\@authortrue \def\command@author{#1}}
\newif\if@faculty \@facultyfalse
\newcommand{\Faculty}[1]{\@facultytrue \def\command@faculty{#1}}
\newif\if@yearSubmission \@yearSubmissionfalse
\newcommand{\YearSubmission}[1]{\@yearSubmissiontrue\def\command@yearSubmission{#1}}
\newif\if@yearPublication \@yearPublicationfalse
\newcommand{\YearPublication}[1]{\@yearPublicationtrue\def\command@yearPublication{#1}}
\newif\if@advisor \@advisorfalse
\newcommand{\Advisor}[1]{\@advisortrue\def\command@advisor{#1}}
\newif\if@freeTextImprint \@freeTextImprintfalse
\newcommand{\FreeTextImprint}[1]{\@freeTextImprinttrue\def\command@freeTextImprint{#1}}

\newif\if@coverDesign \@coverDesignfalse
\newcommand{\CoverDesign}[1]{\@coverDesigntrue\def\command@coverDesign{#1}}
\newif\if@freeTextDesign \@freeTextDesignfalse
\newcommand{\FreeTextDesign}[1]{\@freeTextDesigntrue\def\command@freeTextDesign{#1}}

\newif\if@isbnPrint \@isbnPrintfalse
\newcommand{\ISBNprint}[1]{\@isbnPrinttrue\def\command@isbnPrint{#1}}
\newif\if@isbnOnline \@isbnOnlinefalse
\newcommand{\ISBNonline}[1]{\@isbnOnlinetrue\def\command@isbnOnline{#1}}
\newif\if@urn \@urnfalse
\newcommand{\URN}[1]{\@urntrue\def\command@urn{#1}}

\newif\if@dedication \@dedicationfalse
\newcommand{\Dedication}[1]{\@dedicationtrue\def\command@dedication{#1}}
\newif\if@acknowledgments \@acknowledgmentsfalse
\newcommand{\Acknowledgments}[1]{\@acknowledgmentstrue\def\command@acknowledgments{#1}}
\newif\if@preface \@prefacefalse
\newcommand{\Preface}[1]{\@prefacetrue\def\command@preface{#1}}
\newif\if@abstract \@abstractfalse
\newcommand{\Abstract}[1]{\@abstracttrue\def\command@abstract{#1}}

%-------------------------------------
% Miscellaneous commands and variables
%-------------------------------------

\newcommand{\springEvenPage}{\ifodd\count0\else\mbox{}\clearpage\fi}
\newcommand{\springEvenPageNoNumber}{\ifodd\count0\else\mbox{}\thispagestyle{empty}\clearpage\fi}

%-----------------------------------------------------------------
% \chapter* does not update table of contents and marks.
% This commmand adds the required marks preserving the page style.
%-----------------------------------------------------------------
\newcommand{\addMarkChapterStar}[1]{\markboth{#1}{}\markright{#1}}

%----------------
% Half title page
%----------------
\if@halfTitlePage
	\newcommand{\makeHalfTitlePage}{%
		\hfill\parbox{\length@titles}{\vspace*{10mm}\sffamily{%
				\noindent
				{\large\if@author\command@author\else AUTHOR NAME\fi}\\[14pt]
				{\large\if@titleHalf\command@titleHalf\else\if@title\command@title\else TITLE\fi\fi}
			}
		}
		\clearpage
	}
\fi

%-----------
% Title page
%-----------
\if@titlePage
	\newcommand{\makeTitlePage}{%
		\springEvenPage
		\hfill\parbox{\length@titles}{%
			\vspace*{10mm}
			{\sffamily{%
				{
					{
						\noindent
						\fontsize{16}{18}\selectfont
						\if@author
							\command@author
						\else
							AUTHOR NAME
						\fi
						\\[20pt]
					}
					{
						\fontsize{20}{24}\selectfont
						\if@title
							\command@title
						\else
							TITLE
						\fi
					}
					\if@subTitle
						\\[12pt]
						{
							\fontsize{12}{14}\selectfont
							\command@subTitle
						}
					\fi
				}
			}}
		}
		\vfill\hfill\parbox{\length@titles}{%
			\noindent\printLogo
		}
		\clearpage
	}
\fi

%-------------
% Imprint page
%-------------
\if@imprintPage
	\newcommand{\makeImprintPage}{%
		\vspace*{4mm}
		{\sffamily{%
			{
				\fontsize{8}{10}\selectfont
				\noindent
				\if@dissertation
					Dissertation, Julius-Maximilians-Universit\"at W\"urzburg\\
					\if@faculty
						\command@faculty
					\else
						FACULTY NAME
					\fi,
					\if@yearSubmission
						\command@yearSubmission
					\else
						SUBMISSION YEAR
					\fi
					%Dongliang's commented following seven lines
					%\\ Gutachter:
					%\if@advisor
					%	\command@advisor
					%\else
					%	ADVISOR NAMES
					%\fi
					\\
				\fi
				\if@freeTextImprint
					\command@freeTextImprint
				\fi
			}

			\vfill

			{
				\fontsize{8}{10}\selectfont
				\noindent
				Impressum\\[8pt]
				Julius-Maximilians-Universit\"at W\"urzburg\\
				W\"urzburg University Press\\
				Universit\"atsbibliothek W\"urzburg\\
				Am Hubland\\
				D-97074 W\"urzburg\\
				www.wup.uni-wuerzburg.de\\[8pt]
				\copyright
				\if@yearPublication
					~\command@yearPublication
				\else
					~PUBLICATION YEAR%
				\fi
				~W\"urzburg University Press\\
				Print on Demand

				\vspace{.8cm}
			
				\noindent
				\if@coverDesign
					Coverdesign:~\command@coverDesign
				\fi
				\if@freeTextDesign
					\if@coverDesign
						\\
					\fi
					\command@freeTextDesign
				\fi
		
				\if@coverDesign
					\vspace{.8cm}
				\else
					\if@freeTextDesign
						\vspace{.8cm}
					\fi
				\fi
		
				\noindent
				ISBN
				\if@isbnPrint
					\command@isbnPrint
				\else
					978-3-95826-XXX-X%
				\fi
				~(print)\\
				ISBN
				\if@isbnOnline
					\command@isbnOnline
				\else
					978-3-95826-XXX-X%
				\fi
				~(online)\\
				URN %
				\if@urn
					\command@urn
				\else
					XXXXXX
				\fi

				\vspace{.8cm}

				\noindent
				\begin{minipage}[t]{17mm}\vspace{-1.5ex}
					\printBySa
				\end{minipage}
				\begin{minipage}[t]{100mm}
					Except otherwise noted, this document{\textemdash}excluding the cover{\textemdash}is licensed under the\\
					Creative Commons License Attribution-ShareAlike 4.0 International (CC BY-SA 4.0):\\
					https://creativecommons.org/licenses/by-sa/4.0/
				\end{minipage}

				\bigskip

				\noindent
				\begin{minipage}[t]{17mm}\vspace{-1.5ex}
					\printByNcNd
				\end{minipage}
				\begin{minipage}[t]{100mm}
					The cover page is licensed under the Creative Commons License\\
					Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0):\\
					https://creativecommons.org/licenses/by-nc-nd/4.0/
				\end{minipage}
			}
		}}

		\clearpage
	}
\fi

%---------------------
% Dedication page
%---------------------
\if@dedicationPage
	\newcommand{\makeDedicationPage}{%
		%\chapter{\the@dedicationLabel}
		%\thispagestyle{empty}
		\if@dedication\command@dedication\fi
		\clearpage\springEvenPageNoNumber
	}
\fi

%---------------------
% Acknowledgments page
%---------------------
\if@acknowledgmentsPage
	\newcommand{\makeAcknowledgmentsPage}{%
		\chapter{\the@acknowledgmentsLabel}
		%\thispagestyle{empty}
		\if@acknowledgments\command@acknowledgments\fi
		\clearpage\springEvenPageNoNumber
	}
\fi

%-------------
% Preface page
%-------------
\if@prefacePage
	\newcommand{\makePrefacePage}{%
		\chapter{\the@prefaceLabel}
		%\thispagestyle{empty}
		\if@preface\command@preface\fi
		\clearpage\springEvenPageNoNumber
	}
\fi

%--------------
% Abstract page
%--------------
\if@abstractPage
	\newcommand{\makeAbstractPage}{%
		\chapter{\the@abstractLabel}
		%\thispagestyle{empty}
		\if@abstract\command@abstract\fi
		\clearpage\springEvenPageNoNumber
	}
\fi

%------------------
% Table of contents
%------------------
\if@tableOfContentsPage
	\newcommand{\makeTableOfContentsPage}{%
		{\renewcommand*{\familydefault}{\sfdefault}\sffamily{\tableofcontents}}
		\clearpage\springEvenPageNoNumber
	}
\fi

%-------------
% Front matter
%-------------
% The command \AtBeginDocument for typesetting is not allowed, from
% LaTeX Companion, 2nd ed, p. 884. Workaround: use AfterEndPreamble from package
% etoolbox
\RequirePackage{etoolbox}
\AfterEndPreamble{%
	\frontmatter
	\pagenumbering{roman}
	\pagestyle{empty}
	
 	\if@halfTitlePage\makeHalfTitlePage\fi
 	
	\if@titlePage\makeTitlePage\fi

	\if@imprintPage\makeImprintPage\fi
	
	\if@dedicationPage\makeDedicationPage\fi
	
	\pagestyle{fancy}

	\if@acknowledgmentsPage\makeAcknowledgmentsPage\fi

	\if@prefacePage\makePrefacePage\fi

	\if@abstractPage\makeAbstractPage\fi

	\if@tableOfContentsPage\makeTableOfContentsPage\fi

	\mainmatter
	\pagenumbering{arabic}	 
	 
	\pagestyle{fancy}
	 
%	\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}}
	\renewcommand{\chaptermark}[1]{\addMarkChapterStar{\thechapter\ #1}}
	\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
}
