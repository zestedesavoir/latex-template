# Contributing

## Testing

There is a Makefile to ease the tests:

```bash
make clean # clean all the LaTeX auxiliary files
make test # compile test.tex into a pdf using zmdocument.cls
```

## Contribution rules

+ Contribution via Issues and/or Pull Requests (PR) on the `master` branch.
+ If a new macro/environment is defined, it should be used in `test.tex`, and documented in [`documentation.md`](./documentation.md).
+ The travis build should succeed. If you add new packages, please update `EXTRA_PACKAGES` in [`scripts/install_texlive.sh`](scripts/install_texlive.sh) until it build correctly.
+ Please respect the coding style (see below).

## Coding style

+ Names and comments must be in English.
+ Custom environement names should be in PascalCase and custom macros, colors, lenghts and counters in camelCase.
+ Add your work in the good part of the class.
+ Prefix, if possible, your work by `%%% XXXX`, describing what the macros and/or environement makes.
+ Use **3** spaces for indentation.
+ If multilines code:
    + Environement: `\begin{xxx}` and `\end{xxx}` should be at the same level of indentation. The level of indentation should increase in environement.
    + Terminating braces (`}`) (for example in  `\newcommand') should be at the same level of indentation as the opening one (`\xxx{`). The level of indentation should increase between the braces.
