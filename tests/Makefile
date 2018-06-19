.PHONY: test-images

TEX = lualatex
DRAFTFLAG = -draftmode
TEXFLAGS = -shell-escape

all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test       to generate the test pdf"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

%.pdf: %.tex
	export TEXINPUTS=".:../:$${TEXINPUTS}";\
	export LUAINPUTS=".:../:$${LUAINPUTS}";\
	$(TEX) $(TEXFLAGS) $(DRAFTFLAG) $<;\
	$(TEX) $(TEXFLAGS) $(DRAFTFLAG) $<;\
	makeglossaries $(basename $<); \
	$(TEX) $(TEXFLAGS) $<;\

test: test.pdf

test-author: test-author.pdf

test-images: test-with-images.pdf

test-nocolor: test-nocolor.pdf

clean:
	rm -f *.aux *.log *.out *.pdf *.thm *.toc *.glg *.glo *.gls *.glsdefs *.ist *.gz *.listing
	rm -rf _minted-*
	rm -f test-images/*converted-to*
