# Variables
# --------------------------

DOCBOOK_DIR = /usr/share/sgml/docbook
DOCBOOK_XSL_DIR = $(DOCBOOK_DIR)/xsl-stylesheets
FOP_DIR = $(DOCBOOK_DIR)/fop-1.1

DOCBOOK_BOOK_NAME = OpenGLNotes

# Targets
# --------------------------

.PHONY: all
# all: chunk single pdf

chunk: Dist/html/chunk/$(DOCBOOK_BOOK_NAME).html
single: Dist/html/single/$(DOCBOOK_BOOK_NAME).html
pdf: Dist/pdf/$(DOCBOOK_BOOK_NAME).pdf

# Dependencies
# --------------------------

XSL/chunk.xsl: XSL/sharedparts_html.xsl
XSL/html.xsl: XSL/sharedparts_html.xsl
XSL/sharedparts_html.xsl: XSL/sharedparts.xsl
XSL/pdf.xsl: XSL/sharedparts.xsl

Dist/html/chunk/%.html: Content/%.xml XSL/chunk.xsl
	xsltproc --xinclude --output $@ XSL/chunk.xsl $<

Dist/html/single/%.html: Content/%.xml XSL/html.xsl
	xsltproc --xinclude --output $@ XSL/html.xsl $<

Dist/pdf/%.pdf: Content/%.xml XSL/pdf.xsl
	xsltproc --xinclude --output Dist/pdf/$(DOCBOOK_BOOK_NAME).fo --stringparam fop1.extensions 1 XSL/pdf.xsl $<
	$(FOP_DIR)/fop -c $(CYGWIN_HOME)$(FOP_DIR)/conf/fop.xconf Dist/pdf/$(DOCBOOK_BOOK_NAME).fo $@

.PHONY: clean
clean:
	rm -r Dist