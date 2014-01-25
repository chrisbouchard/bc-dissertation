TEX_DIR := tex
IMAGE_DIR := images
CHAPTER_DIR := chapters

TEX_DEPS := $(wildcard tex/*)
CHAPTER_DEPS := $(wildcard chapters/*)

Thesis.pdf : Thesis.tex chapters.tex $(TEX_DEPS)
	latexmk -xelatex -g -pdf -dvi- -ps- $<

chapters.tex : $(CHAPTER_DEPS)
	@{ $(foreach file, $^, echo "\input{$(file)}";) } > $@

