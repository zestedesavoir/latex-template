TEX = lualatex
DRAFTFLAG = -draftmode
TEXFLAGS = -shell-escape -interaction=nonstopmode

all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  tests      to generate the tests pdf"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

%.pdf: %.tex
	export TEXINPUTS=".:../:$${TEXINPUTS}";\
	export LUAINPUTS=".:../:$${LUAINPUTS}";\
	$(TEX) $(TEXFLAGS) $(DRAFTFLAG) $<;\
	$(TEX) $(TEXFLAGS) $(DRAFTFLAG) $<;\
	makeglossaries $(basename $<); \
	$(TEX) $(TEXFLAGS) $<;\

simple-test: test.pdf

author-test: test-author.pdf

images-test: test-with-images.pdf

create-nocolor:
	cp test.tex test-nocolor.tex
	patch test-nocolor.tex < nocolor.patch

lua-test:
	./testlua.sh

test-nocolor.pdf: test-nocolor.tex

nocolor-test: create-nocolor test-nocolor.pdf

tests: simple-test author-test images-test nocolor-test

clean:
	rm -f test-nocolor.tex
	rm -f *.aux *.log *.out *.pdf *.thm *.toc *.glg *.glo *.gls *.glsdefs *.ist *.gz *.listing *.splr
	rm -rf _minted-*
	rm -f test-images/*converted-to*
