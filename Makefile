
REVIEW_BRANCH ?= latest-review
INTERACTION ?= -interaction=nonstopmode

.PHONY: all
all: root.pdf

root.pdf: root.tex
	pdflatex $(INTERACTION) root.tex || true
	pdflatex $(INTERACTION) root.tex
#	biblatex bibliography
#	pdflatex $(INTERACTION) root.tex
#	pdflatex $(INTERACTION) root.tex

root-diff.tex: latexdiff
	PATH=$(PWD)/latexdiff:$(PATH) latexdiff-vc --git -r $(REVIEW_BRANCH) --flatten=1 --exclude-textcmd=chapter,section,subsection,subsubsection root.tex
	mv root-diff$(REVIEW_BRANCH).tex root-diff.tex

root-diff.pdf: root-diff.tex
	pdflatex $(INTERACTION) root-diff.tex || true
	pdflatex $(INTERACTION) root-diff.tex

latexdiff:
	[ -d latexdiff ] || git clone "https://github.com/ssaavedra/latexdiff.git"

clean:
	rm -f *.aux *.lof *.log *.lot *.maf *.mtc* *.out *.toc *-diff*

dist-clean: clean
	rm -rf latexdiff root.pdf

