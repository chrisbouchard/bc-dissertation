TEX_DEPS := tex/abstract.tex tex/acknowledgements.tex tex/environments.tex \
    tex/copyright.tex tex/notation.tex tex/packages.tex tex/setup.tex \
    tex/titlepage.tex

IMAGE_DEPS := img/logo_A2_pms124_269.eps

CHAPTER_DIR := chapters
CHAPTER_DEPS := $(wildcard $(CHAPTER_DIR)/*.tex)

OUTPUT_DIR := output

.PHONY : pdf view pdf-view

all : $(OUTPUT_DIR)/Thesis.pdf

pdf : $(OUTPUT_DIR)/Thesis.pdf

pdf-view : pdf view

chapters.tex : bin/gen-input-list.zsh $(CHAPTER_DEPS)
	bin/gen-input-list.zsh $(CHAPTER_DIR) > $@

$(OUTPUT_DIR)/Thesis.pdf : Thesis.tex Thesis.bib Makefile chapters.tex \
    $(TEX_DEPS) $(IMAGE_DEPS)
	mkdir -p $(OUTPUT_DIR)
	latexmk -g -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $<

view :
	bin/skim-view.zsh $(OUTPUT_DIR)/Thesis.pdf

