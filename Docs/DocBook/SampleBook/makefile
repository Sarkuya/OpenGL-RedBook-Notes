# Makefile for generating DocBook documents.
# Copyright (C) Sarkuya 2015

CONTENTS := Content/chapter1.xml Content/chapter2.xml Content/SampleBook.xml
CSSES := CSS/style.css
## TODO: Need for images even if its folder is empty


OBJS = $(CONTENTS) $(CSSES)

DISTDIR := Dist

.PHONY: all
all: $(OBJS)
	echo done.



$(OBJS): | $(DISTDIR)


$(DISTDIR):
	mkdir $(DISTDIR)



.PHONY: clean
clean :
	-rm -r Dist

