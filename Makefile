all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test       to generate the test pdf"
	@echo "  travis     to test the repository with travis"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

test:
	texliveonfly.py --engine=pdflatex -shell-escape -interaction=nonstopmode test.tex
	pdflatex -shell-escape -interaction=nonstopmode test.tex
	makeglossaries test
	pdflatex -shell-escape -interaction=nonstopmode test.tex

clean:
	rm *.aux *.log *.out *.pdf *.thm *.toc *.glg *.glo *.gls *.glsdefs *.ist
	rm -r _minted-test
