all: pdflx mkgloss lxmk

pdflx:
	pdflatex -synctex=1 -interaction=nonstopmode thesis.tex
mkgloss:
	makeglossaries thesis
lxmk:
	latexmk -interaction=nonstopmode -synctex=1 -pdf thesis.tex
