[![Travis status](https://travis-ci.org/zestedesavoir/latex-template.svg?branch=master)](https://travis-ci.org/zestedesavoir/latex-template#)

# About

This is a proposal for the [zmarkown](https://github.com/zestedesavoir/zmarkdown) template to help compile Markdown to LaTeX.

Credits go to :

+ [Karnaj](https://github.com/Karnaj), for the original template and many improvements.
+ [Heziode](https://github.com/Heziode), for later improvements.
+ [pierre-24](https://github.com/pierre-24), maintainer of the repository.

# Installation

## Basics

You need a standard (full) LaTeX distribution:

+ Windows: [MikTeX](https://miktex.org/download)
+ Mac OS X: [MacTeX](https://www.tug.org/mactex/mactex-download.html)
+ Linux: [TeXLive](https://tug.org/texlive/) is probably available in your favorite package manager.

Since this template uses the [minted](https://github.com/gpoore/minted/) package you also need [Pygments](http://pygments.org/), probably available in your package manager on Linux or via `pip`:

```bash
pip install Pygments
```

You also need these fonts:

- [Source Code Pro](https://www.fontsquirrel.com/fonts/source-code-pro)
- [Source Sans Pro](https://www.fontsquirrel.com/fonts/source-sans-pro)

## Other images formats

To be able to use GIF and SVG images in your documents, two extra programs are needed:

+ [librsvg](https://github.com/GNOME/librsvg), which uses cairo to convert svg to pdf, and is available under the name `librsvg2-bin` in many package managers ; 
+ The `convert` program, part of the [imagemagick](http://www.imagemagick.org/) tools suite, to convert GIF to PNG. It is probably also available in your package manager.

## Package installation

If you are a developer wanting to help, you can clone this package anywhere and just use the Makefile to run the tests (see [`CONTRIBUTING.md`](./CONTRIBUTING.md)).

To use this package normally, you need to clone it into your `TXMFHOME/tex/latex/` directory (you can know to which location `TXMFHOME` corresponds by running `kpsewhich -var-value TEXMFHOME`, but probably `$HOME/texmf/`). 
Note that you don't need to run `texhash`. 
More information is given for example [here](https://faculty.math.illinois.edu/~hildebr/tex/tips-customstyles.html).

This repo uses submodules. After clone this repo, in root folder of the project, execute this command to download the submodules: `git submodule update --init --recursive`.

Note that this package requires `lualatex` to be called with the `-shell-escape` option (because of minted).

# Testing and using

The different macros and environment are defined in [`zmdocument.cls`](./zmdocument.cls) and documented in [`documentation.md`](./documentation.md).
Here is a skeleton on what your LaTeX document should contain:

```latex
\documentclass{zmdocument}

\title{Title}
\author{Author}
\licence[path/to/image]{Licence name}{URL} % optional
\logo{logo.png}  % if ./logo.png is available

\begin{document}
\maketitle
\tableofcontents

%% ... The rest of your document
\end{document}
```

See [the `test.tex` file in tests](./tests/test.tex) for an example usage of the document class.


# Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md).
