<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="/usr/share/sgml/docbook/xsl-stylesheets/html/docbook.xsl" />
  <xsl:param name="html.stylesheet" select="'css/style.css'" />

  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:param name="toc.section.depth" select="2" />

  <xsl:param name="section.autolabel" select="1" />
  <xsl:param name="section.label.includes.component.label" select="1" />
</xsl:stylesheet>
