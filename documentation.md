# Element already available in LaTeX

## Macros

+ Italic: `\textit{text}`
+ Bold: `\textbf{text}`
+ Strikethrough: `\sout{text}`
+ Superscript and subscript: `\textsubscript{x}` and `\textsuperscript{x}`
+ Inline source code: please use `\texttt{xxx}` rather than `\verb` if possible (see [this post on Stack Exchange](https://tex.stackexchange.com/a/10375)). Special characters (`\ $ & % # ^_ { } ~`) should therefore be escaped.
+ Keys: `\keys{x}`
+ Footnotes: `\footnote{text}`
+ Maths (obviously)

## Environments

+ Lists: `itemize` environment for bulleted, `enumerate` environment for numbered. Inside them, each item is defined with `\item`.
+ Aligned text: text is justified by default, `flushright` and `center` environments are available to change that.

# Class options

+ `big`, `middle` or `small` give access to different levels of sectioning (see section macros below).  
+ `print` permit to have a document to print. The link are not clickable, there are formatted as **\[text](link)**.

# Class macros

## Abbreviations

To add an abbreviation, use `\abbr{word}{definition}`:. Abbreviations will be in a glossary at the end of the document.

**Disclaimer**: word should not contain accented characters or other special characters because of the *glossaries* package.

## `\horizontalLine`

Create a horizontal line.

## `\externalLink`

Create a link with `\externalLink{text}{link}`.

## Section macros

The different title levels are adapted depending on the class option.

| | `small` | `middle` | `big` |
|-|---------|----------------|-----|
|`\levelOneTitle` | `\section` | `\chapter` | `\part`|
|`\levelTwoTitle` | `\subsection` | `\section` | `\chapter`|
|`\levelThreeTitle` | `\subsubsection` | `\subsection` | `\section`|
|`\levelFourTitle`| `\paragraph` | `\subsubsection` | `\subsection` |
|`\levelFiveTitle` |  `\subparagraph` | `\paragraph` | `\subsubsection`|
|`\levelSixTitle` | *n.a.* |  `\subparagraph` | `\paragraph` |
|`\levelSevenTitle` | *n.a.* | *n.a.* |  `\subparagraph`|

For introduction and conclusion, macros are also defined. They don’t take parameters and they print "Introduction" or "Conclusion".

| | `small` | `middle` | `big` |
|-|---------|----------------|-----|
|`\levelOneIntroduction` and `\levelOneConclusion` | Document introduction/conclusion | Document introduction/conclusion | Document introduction/conclusion|
|`\levelTwoIntroduction` and `\levelOneConclusion` | *n.a.* | Chapter introduction/conclusion | Part introduction/conclusion|
|`\levelThreeIntroduction` and `\levelThreeConclusion` | *n.a.* | *n.a.* | Chapter introduction/conclusion |

## Title page macros (`\website`, `\authorlink`, `\editor`, `\editorlogo` and `\logo`)

These macros should be used before `\maketitle` (ideally in the preamble). If they are not used, there are default values. Be careful that `\logo` and `\editorlogo` take in parameter the path of an image (and not an image). The default logo is `default_logo.png` and the default editor logo is `zestedesavoir.png`.

If there is multiple authors, use `\author` with a comma-separated list of them: `\author{author1, author2}`.

## Images

There is two way to include image.

+ With `\image{path}[caption]`, the image is centered and can have a caption.
+ With `\inlineImage{path}`, the image is in the text, not centered.

## Smileys

To obtain a smileys, use `\smiley{xxx}` where `xxx` is an in the directory containing smilies. By default, this directory is `./smileys`. It could be changed using `\smileysPath` macros in the preamble of the document.

```latex
\smileysPath{/path/to/smileys} % path to the directory containing the images of the smilies
```

## Spoilers

To add a spoiler, use `\addSpoiler`: `\addSpoiler{Hide text}`. Spoilers will be in a "Spoiler" section (each chapter will have its "Spoiler" section).

## Iframes

To add an iframe block (for example Youtube videos), use `\iframe`: `\iframe{url}[iframe type][caption]`.

Arguments in square brackets are optionnal (`\iframe{url}` is enough). The default value of `iframe type` is "Vidéo" and the default value for `caption` is blank.

# Class environments

## `Information`, `Question`, `Warning` and `Error`

Mimic the corresponding markdown blocks.

## Quotes

The `Quotation` environment takes an extra parameter, being the source of the quote.

## Code environment

To add a block of code, use the `codeBlock` environment. It takes in parameter the language which should be used (`text` for no language) and three extra parameter (the caption, the numbers of lines which should be colored, and the number of the first line).

```latex
\begin{codeBlock}[eventual caption][5, 8, 9-12][5]{latex}
A \LaTeX command.   
\end{codeBlock}
```
