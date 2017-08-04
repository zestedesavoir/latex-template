.PHONY: test-images

all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test       to generate the test pdf"
	@echo "  travis     to test the repository with travis"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

test:
	pdflatex -draftmode -shell-escape -interaction=nonstopmode test.tex
	pdflatex -draftmode -shell-escape -interaction=nonstopmode test.tex
	makeglossaries test
	pdflatex -shell-escape -interaction=nonstopmode test.tex

test-images:
	pdflatex -draftmode -shell-escape -interaction=nonstopmode test-with-images.tex
	pdflatex -draftmode -shell-escape -interaction=nonstopmode test-with-images.tex
	makeglossaries test-with-images
	pdflatex -shell-escape -interaction=nonstopmode test-with-images.tex

clean:
	rm -f *.aux *.log *.out *.pdf *.thm *.toc *.glg *.glo *.gls *.glsdefs *.ist *.gz
	rm -rf _minted-*
	rm -f test-images/*converted-to*
