.PHONY: test-images

all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test       to generate the test pdf"
	@echo "  travis     to test the repository with travis"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

test:
	lualatex -draftmode -shell-escape -interaction=nonstopmode test.tex
	lualatex -draftmode -shell-escape -interaction=nonstopmode test.tex
	makeglossaries test
	lualatex -shell-escape -interaction=nonstopmode test.tex

test-images:
	lualatex -draftmode -shell-escape -interaction=nonstopmode test-with-images.tex
	lualatex -draftmode -shell-escape -interaction=nonstopmode test-with-images.tex
	makeglossaries test-with-images
	lualatex -shell-escape -interaction=nonstopmode test-with-images.tex

test-without-toc:
	lualatex -draftmode -shell-escape -interaction=nonstopmode test-without-toc.tex
	lualatex -draftmode -shell-escape -interaction=nonstopmode test-without-toc.tex
	makeglossaries test-without-toc
	lualatex -shell-escape -interaction=nonstopmode test-without-toc.tex

clean:
	rm -f *.aux *.log *.out *.pdf *.thm *.toc *.glg *.glo *.gls *.glsdefs *.ist *.gz
	rm -rf _minted-*
	rm -f test-images/*converted-to*
	rm -f *.data
