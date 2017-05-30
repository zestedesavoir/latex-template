all: help

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test       to generate the test pdf"
	@echo "  clean      to clean all LaTeX auxiliary files"
	@echo "  help       to get this help"

test:
	pdflatex -shell-escape test.tex

clean:
	rm *.aux *.log *.out *.pdf *.thm *.toc
