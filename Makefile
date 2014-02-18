TEX_DEPS := tex/abstract.tex tex/acknowledgements.tex tex/environments.tex \
    tex/copyright.tex tex/notation.tex tex/packages.tex tex/setup.tex \
    tex/titlepage.tex

IMAGE_DEPS := img/logo_A2_pms124_269.eps

CHAPTER_DIR := chapters
CHAPTER_DEPS := $(wildcard $(CHAPTER_DIR)/*.tex)

OUTPUT_DIR := output

all : Thesis.pdf

chapters.tex : bin/gen-input-list.zsh $(CHAPTER_DEPS)
	bin/gen-input-list.zsh $(CHAPTER_DIR) > $@

Thesis.pdf : Thesis.tex Thesis.bib Makefile chapters.tex $(TEX_DEPS) \
    $(IMAGE_DEPS)
	latexmk -g -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $<

