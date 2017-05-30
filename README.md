# About

This is a proposal for the [zmarkown](https://github.com/zestedesavoir/zmarkdown) template to convert MDAST to LaTeX.

# Installation

You need a standard (full) LaTeX distribution:

+ Windows: [MikTeX](https://miktex.org/download)
+ Mac OS X: [MacTeX](https://www.tug.org/mactex/mactex-download.html)
+ Linux: [TeXLive](https://tug.org/texlive/) is probably available in your favorite package manager. 

Since this template use the [minted](https://github.com/gpoore/minted/) package, you also need [Pygments](http://pygments.org/), which is probably available in your package manager on Linux, or via:

```bash
pip install Pygments
```

Note that this package require latex to be called with the `-shell-escape` option.

# Testing and using

The different macros and environement are defined in `zmdocument.cls` and documented [here](./documentation.md). 
This file can be placed in the same directory as the `.tex` file (or in [your `texmf` directory](http://www.math.illinois.edu/~ajh/tex/tips-customstyles.html)).

Here is a skeleton on what your LaTeX document should contains

```latex
\documentclass{zmdocument}

\title{Title}
\author{Author}
\licence{CC-BY-NC-ND}
\logo{logo.png}  % if logo.png is available

\begin{document}
\maketitle
\tableofcontents

%% ... The rest of your document
\end{document}
```

See [`test.tex`](./test.tex) for an example on how to use the document class.


# Contributing

There is a Makefile to ease the tests:

```bash
make clean # clean all the LaTeX auxilliary files
make test # compile test.tex into a pdf using zmdocument.cls
```

+ Via Issues and/or Pull Requests (PR) on the `master` branch.
+ If a new macro/environement is defined, it should be used in `test.tex` (which should, obviously, compile), and documented in `documentation.md`.
