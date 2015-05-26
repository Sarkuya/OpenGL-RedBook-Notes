<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl" />

  <xsl:include href="sharedparts_html.xsl" />
  
  <xsl:param name="chunker.output.encoding" select="'UTF-8'" />
  <xsl:param name="chunker.output.indent" select="'yes'" />

  <xsl:param name="navig.graphics" select="1" />
  <xsl:param name="navig.graphics.path" select="'images/docbook/'" />

</xsl:stylesheet>
