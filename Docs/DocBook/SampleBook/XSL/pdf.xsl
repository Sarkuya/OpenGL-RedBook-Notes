<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
  
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl" />

  <xsl:include href="sharedparts.xsl" />

  <xsl:param name="title.font.family">SimHei</xsl:param>
  <xsl:param name="body.font.family">SimSun</xsl:param>

  <xsl:param name="admon.graphics.path">Dist/pdf/images/docbook/</xsl:param>

  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="zh_cn">
      <l:context name="title-numbered">
        <l:template name="chapter" text="第 %n 章 %t"/>
        <l:template name="section" text="%n %t"/>
      </l:context>
    </l:l10n>
  </l:i18n>
</xsl:stylesheet>
