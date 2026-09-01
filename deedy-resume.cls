%----------------------------------------------------------------------------------------
%	Deedy CV/Resume class (modernized)
%	Based on the Deedy CV/Resume template by Debarghya Das
%	(https://www.debarghyadas.com), with extensive modifications by Vel
%	(vel@latextemplates.com). Licensed under CC BY-NC-SA 3.0
%	(http://creativecommons.org/licenses/by-nc-sa/3.0/).
%
%	This class must be compiled with XeLaTeX.
%----------------------------------------------------------------------------------------

\ProvidesClass{deedy-resume}[2026/09/01 v2.0 Deedy CV/Resume class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
%	ENGINE CHECK
%----------------------------------------------------------------------------------------

\RequirePackage{iftex}
\RequireXeTeX % Error out if not compiled with XeLaTeX

%----------------------------------------------------------------------------------------
%	PACKAGES
%----------------------------------------------------------------------------------------

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage{xcolor} % Required for custom colors
\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX
\usepackage{titlesec} % Required for customizing section/subsection/etc titles
\usepackage[absolute]{textpos} % Required for positioning the Last Updated text at the top right of the page
\usepackage[UKenglish]{isodate} % Prints the Last Updated date in UK English format
\usepackage{hyperref} % Required for links

\hypersetup{
	hidelinks, % No colored borders or boxes around links
	pdfauthor={Nugroho Satriyanto}, % PDF metadata
	pdfcreator={XeLaTeX}
}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\defaultfontfeatures{Ligatures=TeX} % Modern replacement for Mapping=tex-text

% Named font families, defined once and reused throughout the class
\newfontfamily\headlinefont[Path = fonts/lato/]{Lato-Hai} % First name
\newfontfamily\lightfont[Path = fonts/lato/]{Lato-Lig} % Last name, section titles
\newfontfamily\boldfont[Path = fonts/lato/]{Lato-Bol} % Subsection titles
\newfontfamily\mediumfont[Path = fonts/raleway/]{Raleway-Medium} % Contact info, descriptions, locations
\newfontfamily\lightestfont[Path = fonts/raleway/]{Raleway-ExtraLight} % Sans-serif body, Last Updated

\setmainfont[
	Color = primary,
	Path = fonts/lato/,
	BoldFont = Lato-Reg,
	ItalicFont = Lato-LigIta,
	BoldItalicFont = Lato-RegIta
]{Lato-Lig} % The primary font for content text; defines bold, italic and bold-italic as well

\setsansfont[Scale = MatchLowercase, Path = fonts/raleway/]{Raleway-ExtraLight} % The font used where \sffamily is called

%----------------------------------------------------------------------------------------
%	LAST UPDATED COMMAND
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets the units for the horizontal position used in the \begin{textblock} argument
\setlength{\TPVertModule}{0.01\paperwidth} % Sets the units for the vertical position used in the \begin{textblock} argument
\newcommand{\lastupdated}{ % Create a new command for printing the Last Updated text
\begin{textblock}{25}(75,2) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\color{date}\lightestfont\fontsize{8pt}{10pt}\selectfont % Text styling of the text
Last Updated on \today % Last Updated text
\end{textblock}}

%----------------------------------------------------------------------------------------
%	MAIN HEADING COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\namesection}[3]{ % Defines the command for the main heading
\centering{ % Center the name
\fontsize{40pt}{60pt} % Font size
\headlinefont\selectfont #1 % First name font
\lightfont\selectfont #2 % Last name font
} \\[5pt] % Whitespace between the name and contact information
\centering{ % Center the contact information
\color{headings} % Use the headings color
\mediumfont\fontsize{11pt}{14pt}\selectfont #3} % Contact information font
\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.4pt}} % Horizontal rule
\vspace{-5pt} % Reduce whitespace after the rule slightly
}

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\newcommand{\sectionspace}{\vspace{8pt}} % Defines a command to add a set amount of space after sections and subsections

\titleformat{\section}{ % Customize the large section titles
\color{headings}\scshape\lightfont\fontsize{16pt}{24pt}\selectfont\raggedright\uppercase}{}{0em}{}

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\color{subheadings}\boldfont\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{ % Used for creating subsections where a description is required on the same line
\color{subheadings}\boldfont\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

\newcommand{\descript}[1]{ % Used for describing the subsection either on the same line or underneath
\color{subheadings}\raggedright\scshape\mediumfont\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

\newcommand{\location}[1]{ % Used for specifying a duration and/or location under a subsection
\color{headings}\raggedright\mediumfont\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

%----------------------------------------------------------------------------------------
%	TIGHT ITEMIZE ENVIRONMENT
%----------------------------------------------------------------------------------------

\newenvironment{tightitemize} % Defines the tightitemize environment which modifies the itemize environment to be more compact
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}
