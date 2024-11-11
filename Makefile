SHELL := /bin/bash
OUTPUT_DIR = output

all: $(OUTPUT_DIR)/resume.html $(OUTPUT_DIR)/resume.pdf

$(OUTPUT_DIR):
	rm -rf $(OUTPUT_DIR)  
	mkdir -p $(OUTPUT_DIR)
	cp style.css $(OUTPUT_DIR)/
	cp -r assets $(OUTPUT_DIR)/

$(OUTPUT_DIR)/resume.html: resume.md $(OUTPUT_DIR)
	pandoc --standalone --output=$(OUTPUT_DIR)/resume.html --css=style.css resume.md

$(OUTPUT_DIR)/resume.pdf: $(OUTPUT_DIR)/resume.html
	wkhtmltopdf --enable-local-file-access $(OUTPUT_DIR)/resume.html $(OUTPUT_DIR)/resume.pdf

clean:
	rm -rf $(OUTPUT_DIR)

help:
	@echo "Makefile for building and converting resume to PDF and HTML"
	@echo "  make         - Build HTML and PDF versions of resume"
	@echo "  make clean   - Clean output directory"

.PHONY: all clean help
