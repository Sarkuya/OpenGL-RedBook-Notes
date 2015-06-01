<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xml:space="preserve">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:preserve-space elements="books book title author" />
  
  <xsl:template match="/">
    <books>
      <xsl:apply-templates />
    </books>
  </xsl:template>
  
  <xsl:template match="books/book">
    <book>
      <xsl:apply-templates select="title|author" />
    </book>
  </xsl:template>
  
  <xsl:template match="book/title">
    <title><xsl:apply-templates /></title>
  </xsl:template>
  
  <xsl:template match="book/author">
    <author><xsl:apply-templates /></author>
  </xsl:template>
</xsl:stylesheet>