# Element already available in LaTeX

## Macros

+ Italic: `\textit{text}`
+ Bold: `\textbf{text}`
+ Strikethrough: `\sout{text}`
+ Superscript and subscripts: `\textsubscript{x}` and `\textsuperscript{x}`
+ Inline source code: "\verb\`text\`"
+ Links: `\href{url}{text}`
+ Keys: `\keys{x}`
+ Footnotes: `\footnote{text}`
+ Maths (obviously)

## Environements

+ Lists: `itemize` environement for bulleted, `enumerate` environement for numbered. Inside them, each item is defined with `\item`.
+ Aligned text: text is justifed by default, `flushright` and `center` environements are available to change that.
+ Code: the `minted` environement.

# Class options

+ `big`, `middle` or `small` give access to different level of sectioning (see section macros below).  

# Class macros

## `\horizontalLine`

Create an horizontal line.

## Section macros

The differents title level are adapted depending on the class option.

| | `small` | `middle` | `big` |
|-|---------|----------------|-----|
|`\LevelOneTitle` | `\section` | `\chapter` | `\part`|
|`\LevelTwoTitle` | `\subsection` | `\section` | `\chapter`|
|`\LevelThreeTitle` | `\subsubsection` | `\subsection` | `\section`|
|`\LevelFourTitle`| `\paragraph` | `\subsubsection` | `\subsection` |
|`\LevelFiveTitle` |  `\subparagraph` | `\paragraph` | `\subsubsection`|
|`\LevelSixTitle` | *n.a.* |  `\subparagraph` | `\paragraph` |
|`\LevelSevenTitle` | *n.a.* | *n.a.* |  `\subparagraph`|

For introduction and conclusion, `\Introduction` and `\Conclusion` are also defined.

## Title page macros (`\website`, `\authorlink`, `\editor` and `\logo`)

These macros shoud be used before `\maketitle` (ideally in the preamble). If they are not used, there are default values. Be careful that `\logo` take in parameter the path of an image (and not an image).

If there is multiple authors, use `\author` with a comma-separated list of them: `\author{author1, author2}`. 

# Class environements

## `Information`, `Question`, `Warning` and `Error`

Mimick the corresponding markdown blocks.
