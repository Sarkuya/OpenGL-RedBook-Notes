<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="/usr/share/sgml/docbook/xsl-stylesheets/html/chunk.xsl" />
  <xsl:param name="html.stylesheet" select="'css/style.css'" />

  <xsl:param name="chunker.output.encoding" select="'UTF-8'" />
  <xsl:param name="chunker.output.indent" select="'yes'" />

  <xsl:param name="toc.section.depth" select="2" />

  <xsl:param name="section.autolabel" select="1" />
  <xsl:param name="section.label.includes.component.label" select="1" />

  <xsl:param name="admon.graphics" select="1" />
  <xsl:param name="admon.graphics.path" select="'images/docbook/'" />
  <xsl:param name="admon.graphics.extension" select="'.png'" />
  <xsl:param name="admon.textlabel" select="0" />

  <xsl:param name="navig.graphics" select="1" />
  <xsl:param name="navig.graphics.path" select="'images/docbook/'" />

</xsl:stylesheet>
