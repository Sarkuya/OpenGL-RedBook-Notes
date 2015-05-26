<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:param name="toc.section.depth">2</xsl:param>

  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>

  <xsl:param name="admon.graphics">1</xsl:param>
  <xsl:param name="admon.graphics.extension">.png</xsl:param>
  <xsl:param name="admon.textlabel">1</xsl:param>

  <xsl:param name="refentry.generate.name">0</xsl:param>
  <xsl:param name="refentry.generate.title">1</xsl:param>

  <xsl:param name="generate.toc">
    book toc,title,figure,table,example,equation
    part toc,title
  </xsl:param>
  
  <xsl:template match="table[@role = 'NotInToc']" mode="toc" />

  <xsl:param name="ulink.hyphenate.chars">/&amp;?</xsl:param>
  <xsl:param name="ulink.hyphenate">&#xAD;</xsl:param>

  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="zh_cn">
      <l:context name="title-numbered">
        <l:template name="chapter" text="第 %n 章 %t"/>
        <l:template name="section" text="%n %t"/>
      </l:context>
    </l:l10n>

    <l:l10n language="en">
      <l:context name="title-numbered">
        <l:template name="chapter" text="Chapter %n. %t"/>
        <l:template name="section" text="%n %t"/>
      </l:context>
    </l:l10n>
  </l:i18n>
</xsl:stylesheet>