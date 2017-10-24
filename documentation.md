# Element already available in LaTeX

## Macros

+ Italic: `\textit{text}`
+ Bold: `\textbf{text}`
+ Strikethrough: `\sout{text}`
+ Superscript and subscript: `\textsubscript{x}` and `\textsuperscript{x}`
+ Keys: `\keys{CTRL + A}`
+ Footnotes: when defining a footnote, `\footnotetext[num]{\label{x} text}` (where `num` is the number of the footnote), when using the footnote, `\textsuperscript{\ref{x}}`.
+ Maths (obviously)

## Environments

+ Lists: `itemize` environment for unordered lists, `enumerate` environment for numbered lists. Inside them, each item is defined with `\item`.
+ Text alignment: text is flush left aligned by default, `flushright` and `center` environments are available as alternatives.

# Class options

1. `big`, `middle` or `small` provide different levels of document sectioning (see section macros below).
1. `print` adapts the style for printing. The link are not clickable: they are formatted as **\[text](link)**.

# Class macros

## Abbreviations

To add an abbreviation, use `\abbr{word}{definition}`. Abbreviations will be listed in a glossary at the end of the document.

**Warning**: `word` should not contain accented characters or other special characters because of the *glossaries* package.

## Thematic break

Use `\horizontalLine`.

## External link

Create a link with `\externalLink{text}{URL}`.

## Licence

Add licence with `\licence[path/to/image]{Licence name}{URL}` 

## Inline source code 

Create a inline source code with `\CodeInline[bash]{make test}`

## Section macros

The different title levels get adapted depending on the class option used.

| | `small` | `middle` | `big` |
|-|---------|----------------|-----|
|`\levelOneTitle` | `\section` | `\chapter` | `\part`|
|`\levelTwoTitle` | `\subsection` | `\section` | `\chapter`|
|`\levelThreeTitle` | `\subsubsection` | `\subsection` | `\section`|
|`\levelFourTitle`| `\paragraph` | `\subsubsection` | `\subsection` |
|`\levelFiveTitle` |  `\subparagraph` | `\paragraph` | `\subsubsection`|
|`\levelSixTitle` | *n.a.* |  `\subparagraph` | `\paragraph` |
|`\levelSevenTitle` | *n.a.* | *n.a.* |  `\subparagraph`|

For introduction and conclusion, macros are also defined. They don’t take parameters and they are titled "Introduction" / "Conclusion".

| | `small` | `middle` | `big` |
|-|---------|----------------|-----|
|`\levelOneIntroduction` and `\levelOneConclusion` | Document introduction/conclusion | Document introduction/conclusion | Document introduction/conclusion|
|`\levelTwoIntroduction` and `\levelOneConclusion` | *n.a.* | Chapter introduction/conclusion | Part introduction/conclusion|
|`\levelThreeIntroduction` and `\levelThreeConclusion` | *n.a.* | *n.a.* | Chapter introduction/conclusion |

## Title page macros (`\website`, `\authorlink`, `\editor`, `\editorlogo` and `\logo`)

These macros should be used before `\maketitle` (ideally in the preamble). If they are not used, there are default values. Be aware that `\logo` and `\editorlogo` take the path to an image (and not an image) as parameter. The default logo is `default_logo.png`.

Editor logo take an optional parameter which is a sentence/slogan. Exemple: `\editorlogo[slogan]{path/to/image}`

If there are multiple authors, use `\author` with a comma-separated list of authors: `\author{author1, author2}`.

## Images

There is two ways of including an image.

+ Use `\image{path}[caption]` to have it centered with an optional caption.
+ Use `\inlineImage{path}` to inline an image in your text.

## Smileys

To obtain a smiley, use `\smiley{xxx}` where `xxx` is a file from the smileys directory. By default this directory is `./smileys`. It can be modified by using `\smileysPath{path}` in the preamble of the document.

```latex
\smileysPath{/path/to/smileys} % path to the directory containing the images of the smileys
```

## Iframes

To add an iframe block (for example Youtube videos), use `\iframe`: `\iframe{url}[iframe type][caption]`.

Arguments in square brackets are optional (`\iframe{url}` is enough). The default `iframe type` parameter is "vidéo" and the default `caption` value is blank.

# Class environments

## `Information`, `Question`, `Warning` and `Error`

Mimic the corresponding markdown blocks.

## Quotes

The `Quotation` environment takes the the source of a quote as extra parameter.

## Spoilers

To add a spoiler, use the `Spoiler` environement. Spoilers will be grouped in order of apparition in a "Spoiler" section at the end of each chapter.

## Code environment

To add a block of code, use the `CodeBlock` environment. Its parameter is the language which should be used for syntax highlighting (`text` by default), it also accepts three extra parameter:

1. a legend/caption,
2. the line numbers/range to be highlighted,
3. the starting line number.

```latex
\begin{CodeBlock}[optional caption][5, 8, 9-12][5]{latex}
A \LaTeX command.
\end{CodeBlock}
```

## Float environments

In addition to standard float (`table`, `figure`), the `equationFloat` could be used to have mathematics floats or to add a caption to an equation.

```latex
\[
    \sum_{k = 0}^n = \frac{n(n + 1)}{2}
\]
\captionof{equationfloat}{A sum}
```
