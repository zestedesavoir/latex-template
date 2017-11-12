[![Travis status](https://travis-ci.org/zestedesavoir/latex-template.svg?branch=master)](https://travis-ci.org/zestedesavoir/latex-template#)

# About

This is a proposal for the [zmarkown](https://github.com/zestedesavoir/zmarkdown) template to help compile Markdown to LaTeX.

Credits go to :

+ [Karnaj](https://github.com/Karnaj), for the original template and many improvements.
+ [pierre-24](https://github.com/pierre-24), maintainer of the repository.

# Installation

You need a standard (full) LaTeX distribution:

+ Windows: [MikTeX](https://miktex.org/download)
+ Mac OS X: [MacTeX](https://www.tug.org/mactex/mactex-download.html)
+ Linux: [TeXLive](https://tug.org/texlive/) is probably available in your favorite package manager.

Since this template uses the [minted](https://github.com/gpoore/minted/) package you also need [Pygments](http://pygments.org/), probably available in your package manager on Linux or via `pip`:

```bash
pip install Pygments
```

Note that this package requires latex to be called with the `-shell-escape` option.

You also need these fonts:

- [Source Code Pro](https://www.fontsquirrel.com/fonts/source-code-pro)
- [Source Sans Pro](https://www.fontsquirrel.com/fonts/source-sans-pro)

## Other images formats

To be abble to use GIF and SVG images in your documents, two extra programs are needed:

+ [librsvg](https://github.com/GNOME/librsvg), which uses cairo to convert svg to pdf, and is available under the name `librsvg2-bin` in many package managers ; 
+ The `convert` program, part of the [imagemagick](http://www.imagemagick.org/) tools suite, to convert GIF to PNG. It is probably also available in your package manager.

# Testing and using

The different macros and environment are defined in [`zmdocument.cls`](./zmdocument.cls) and documented in [`documentation.md`](./documentation.md).
This file can be placed in the same directory as the `.tex` file (or in [your `texmf` directory](http://www.math.illinois.edu/~ajh/tex/tips-customstyles.html)).

Here is a skeleton on what your LaTeX document should contain:

```latex
\documentclass{zmdocument}

\title{Title}
\author{Author}
\licence{CC-BY-NC-ND}
\logo{logo.png}  % if ./logo.png is available

\begin{document}
\maketitle
\tableofcontents

%% ... The rest of your document
\end{document}
```

See [`test.tex`](./test.tex) for an example usage of the document class.


# Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md).
