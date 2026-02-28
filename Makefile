OUTPUT_DIR := output

HTML := $(OUTPUT_DIR)/resume.html
PDF  := $(OUTPUT_DIR)/resume.pdf

all: $(HTML) $(PDF)

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

$(HTML): resume.md style.css | $(OUTPUT_DIR)
	pandoc resume.md \
		--standalone \
		--css=style.css \
		-o $(HTML)

$(PDF): resume.md style.css | $(OUTPUT_DIR)
	pandoc resume.md \
		--standalone \
		--css=style.css \
		--resource-path=. \
		--pdf-engine=weasyprint \
		-o $(PDF)

clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: all clean
