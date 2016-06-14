
INTERACTION ?= -interaction=nonstopmode

.PHONY: all
all: root.pdf

root.pdf: root.tex
	pdflatex $(INTERACTION) root.tex || true
	pdflatex $(INTERACTION) root.tex
#	biblatex bibliography
#	pdflatex $(INTERACTION) root.tex
#	pdflatex $(INTERACTION) root.tex

clean:
	rm -f *.aux *.lof *.log *.lot *.maf *.mtc* *.out *.toc
