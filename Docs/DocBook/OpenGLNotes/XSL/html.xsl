<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl" />

  <xsl:include href="sharedparts_html.xsl" />
  
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template name="user.header.content">
    <div id="user-header">
      <p><b>Produced by Sarkuya</b></p>
      <p><b>2015-05-26</b></p>
      <p><b>Haikou, Hainan, China</b></p>
    </div>
  </xsl:template>

  <xsl:template name="section.titlepage.before.recto">
    <xsl:variable name="top-anchor">
      <xsl:call-template name="object.id">
        <xsl:with-param name="object" select="/*[1]" />
      </xsl:call-template>
    </xsl:variable>
    <p class="return_to_top">
      <a href="#{$top-anchor}">
        <xsl:text>Return to top</xsl:text>
      </a>
    </p>
  </xsl:template>

</xsl:stylesheet>
