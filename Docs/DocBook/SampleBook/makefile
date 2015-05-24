# Makefile for generating DocBook documents.
# Copyright (C) Sarkuya 2015.5

# variables
# --------------------------

DOCBOOK_XSL_DIR = /usr/share/sgml/docbook/xsl-stylesheets

CONTENT_DIR = Content
CSS_DIR = CSS
XSL_DIR = XSL

DIST_DIR = Dist
DIST_HTML_DIR = $(DIST_DIR)/html
DIST_HTML_CHUNK_DIR = $(DIST_HTML_DIR)/chunk
DIST_HTML_CHUNK_CSS_DIR = $(DIST_HTML_CHUNK_DIR)/css
DIST_HTML_CHUNK_IMAGE_DIR = $(DIST_HTML_CHUNK_DIR)/images
DIST_HTML_CHUNK_IMAGE_CUSTOM_DIR = $(DIST_HTML_CHUNK_IMAGE_DIR)/custom
DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR = $(DIST_HTML_CHUNK_IMAGE_DIR)/docbook


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

GenHTMLChunk: $(DOCBOOK_XML_FILES) $(XSL_CHUNK_FILE) $(DIST_HTML_CHUNK_CSS_DIR)/$(CSS_FILES) $(DIST_HTML_CHUNK_IMAGE_DIR)/*
	xsltproc --xinclude --output $(DIST_CHUNK_FILE) $(XSL_CHUNK_FILE) $(DOCBOOK_MAIN_XML_FILE)

$(XSL_CHUNK_FILE) : $(XSL_DIR)/sharedparts_html.xsl
$(XSL_DIR)/sharedparts_html.xsl : $(XSL_DIR)/sharedparts.xsl

$(DIST_HTML_CHUNK_CSS_DIR)/$(CSS_FILES) : | $(DIST_HTML_CHUNK_CSS_DIR)
	cp -r $(CSS_DIR)/. $(DIST_HTML_CHUNK_CSS_DIR)

$(DIST_HTML_CHUNK_CSS_DIR) :
	mkdir -p $(DIST_HTML_CHUNK_CSS_DIR)

#  only one here, TODO : 2

$(DIST_HTML_CHUNK_IMAGE_DIR)/* : $(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR)/*

$(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR)/* : | $(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR)
	cp -r -u $(DOCBOOK_XSL_DIR)/images/. $(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR)

$(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR) :
	mkdir -p $(DIST_HTML_CHUNK_IMAGE_DOCBOOK_DIR)


.PHONY : clean
clean :
	-rm -r Dist

