[![Travis status](https://travis-ci.org/zestedesavoir/latex-template.svg?branch=master)](https://travis-ci.org/zestedesavoir/latex-template#)

# About

This is a proposal for the [zmarkown](https://github.com/zestedesavoir/zmarkdown) template to help convert MDAST to LaTeX. 

Credits go to :

+ [Karnaj](https://github.com/Karnaj), for the original template, and many improvements.
+ [pierre-24](https://github.com/pierre-24), maintainer of the repository.

# Installation

You need a standard (full) LaTeX distribution:

+ Windows: [MikTeX](https://miktex.org/download)
+ Mac OS X: [MacTeX](https://www.tug.org/mactex/mactex-download.html)
+ Linux: [TeXLive](https://tug.org/texlive/) is probably available in your favorite package manager. 

Since this template use the [minted](https://github.com/gpoore/minted/) package, you also need [Pygments](http://pygments.org/), which is probably available in your package manager on Linux, or via:

```bash
pip install Pygments
```

Note that this package requires latex to be called with the `-shell-escape` option.

# Testing and using

The different macros and environment are defined in [`zmdocument.cls`](./zmdocument.cls) and documented in [`documentation.md`](./documentation.md). 
This file can be placed in the same directory as the `.tex` file (or in [your `texmf` directory](http://www.math.illinois.edu/~ajh/tex/tips-customstyles.html)).

Here is a skeleton on what your LaTeX document should contain

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

See [the `CONTRIBUTING.md`](./CONTRIBUTING.md).
