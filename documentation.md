# Element already available in LaTeX

## Macros

+ Italic: `\textit{text}`
+ Bold: `\textbf{text}`
+ Strikethrough: `\sout{text}`
+ Superscript and subscript: `\textsubscript{x}` and `\textsuperscript{x}`
+ Inline source code: "\verb\`text\`"
+ Keys: `\keys{x}`
+ Footnotes: `\footnote{text}`
+ Maths (obviously)

## Environments

+ Lists: `itemize` environment for bulleted, `enumerate` environment for numbered. Inside them, each item is defined with `\item`.
+ Aligned text: text is justified by default, `flushright` and `center` environments are available to change that.
+ Code: the `minted` environment.

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
|`\LevelOneTitle` | `\section` | `\chapter` | `\part`|
|`\LevelTwoTitle` | `\subsection` | `\section` | `\chapter`|
|`\LevelThreeTitle` | `\subsubsection` | `\subsection` | `\section`|
|`\LevelFourTitle`| `\paragraph` | `\subsubsection` | `\subsection` |
|`\LevelFiveTitle` |  `\subparagraph` | `\paragraph` | `\subsubsection`|
|`\LevelSixTitle` | *n.a.* |  `\subparagraph` | `\paragraph` |
|`\LevelSevenTitle` | *n.a.* | *n.a.* |  `\subparagraph`|

For introduction and conclusion, `\Introduction` and `\Conclusion` are also defined.

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
