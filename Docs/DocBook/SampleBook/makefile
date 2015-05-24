# Makefile for generating DocBook documents.
# Copyright (C) Sarkuya 2015.5

# variables
# --------------------------

CONTENT_DIR = Content
CSS_DIR = CSS
XSL_DIR = XSL

DIST_DIR = Dist
DIST_HTML_DIR = $(DIST_DIR)/html
DIST_HTML_CHUNK_DIR = $(DIST_HTML_DIR)/chunk
DIST_HTML_CHUNK_CSS_DIR = $(DIST_HTML_CHUNK_DIR)/css

DOCBOOK_XML_FILES = $(CONTENT_DIR)/$(wildcard *.xml)
DOCBOOK_BOOK_NAME = SampleBook
DOCBOOK_MAIN_XML_FILE = $(CONTENT_DIR)/$(DOCBOOK_BOOK_NAME).xml

XSL_CHUNK_FILE = $(XSL_DIR)/chunk.xsl

CSS_FILES = $(wildcard *.css)

DIST_CHUNK_FILE = $(DIST_HTML_CHUNK_DIR)/$(DOCBOOK_BOOK_NAME).html

# targets
# --------------------------

.PHONY : all

all : GenHTMLChunk

GenHTMLChunk: $(DOCBOOK_XML_FILES) $(XSL_CHUNK_FILE) $(DIST_HTML_CHUNK_CSS_DIR)/$(CSS_FILES)
	xsltproc --xinclude --output $(DIST_CHUNK_FILE) $(XSL_CHUNK_FILE) $(DOCBOOK_MAIN_XML_FILE)

$(XSL_CHUNK_FILE) : $(XSL_DIR)/sharedparts_html.xsl
$(XSL_DIR)/sharedparts_html.xsl : $(XSL_DIR)/sharedparts.xsl

$(DIST_HTML_CHUNK_CSS_DIR)/$(CSS_FILES) : | $(DIST_HTML_CHUNK_CSS_DIR)
	cp -r $(CSS_DIR)/$(CSS_FILES) $(DIST_HTML_CHUNK_CSS_DIR)

$(DIST_HTML_CHUNK_CSS_DIR) :
	mkdir -p $(DIST_HTML_CHUNK_CSS_DIR)



.PHONY : clean
clean :
	-rm -r Dist

