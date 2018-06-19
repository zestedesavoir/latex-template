# Contributing

## Testing

All test files are located into the `tests/` directory.

There is a Makefile to ease testing:

```bash
make clean # clean all the LaTeX auxiliary files
make simple-test # compile test.tex into a pdf using zmdocument.cls

# If you have installed the extra tools for image conversion
make images-test

# if you want to lanch all the tests
make tests

# to clean up:
make clean
```

## Contribution rules

+ Contributions are done via Issues and/or Pull Requests (PR) on the `master` branch.
+ If a new macro/environment is defined, it should be used in `test.tex`, and documented in [`documentation.md`](./documentation.md).
+ The travis build should succeed. If you add new packages, please update `EXTRA_PACKAGES` in [`scripts/install_texlive.sh`](scripts/install_texlive.sh) in order for tests to pass.
+ Please respect the coding style (see below).

## Coding style

+ Names and comments must be in English.
+ Custom environment names should be in PascalCase and custom macros, colors, lengths and counters in camelCase.
+ Add your work in the right part of the class.
+ If possible, prefix your work with `%%% XXXX`, describing what the macros and/or environment does.
+ Use **3** spaces for indentation.
+ For multilines code:
    + Environment: `\begin{xxx}` and `\end{xxx}` should be at the same level of indentation. The level of indentation should increase inside the environment.
    + Terminating brace (`}`) should be at the same level of indentation as the opening one (`\xxx{`). The level of indentation should increase inside the braces.

For example,

```latex
\newenvironment{NewSuperEnvironment}{\begin{center}}{\end{center}} % PascalCase

\newcommand{\newSuperMacro}[2]{% camelCase
   This is #1 ! % Increase level of indentation in braces
   \begin{NewSuperEnvironment}
      And this is #2 ! % Increase level of indentation in environment
   \end{NewSuperEnvironment} % same level of indentation as \begin
} % same level of indentation as \newcommand

%% In the text
\newSuperMacro{Great}{Awesome}
```
