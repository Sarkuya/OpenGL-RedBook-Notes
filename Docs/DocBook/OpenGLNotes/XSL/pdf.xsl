<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl" />

  <xsl:include href="sharedparts.xsl" />

  <xsl:param name="double.sided">1</xsl:param>
  <xsl:param name="draft.mode">yes</xsl:param>
  
  <xsl:param name="title.font.family">Tahoma, Arial, Helvetica, sans-serif</xsl:param>
  <xsl:param name="body.font.family">Arial</xsl:param>
  <xsl:param name="mononspace.font.family">monospace</xsl:param>

  <xsl:attribute-set name="admonition.properties">
    <xsl:attribute name="border">0.5pt solid blue</xsl:attribute>
    <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
    <xsl:attribute name="padding">0.1in</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- Formatting programlisting -->
  <!-- background -->
  <xsl:param name="shade.verbatim">1</xsl:param>
  <xsl:attribute-set name="shade.verbatim.style">
    <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
    <xsl:attribute name="border-width">0.5pt</xsl:attribute>
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-color">#575757</xsl:attribute>
    <xsl:attribute name="padding">3pt</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- breaking lone lines -->
  <xsl:param name="hyphenate.verbatim">1</xsl:param> <!-- FOP doesn't support! -->

  <xsl:attribute-set name="monospace.verbatim.properties">
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    <xsl:attribute name="hyphenation-character">\</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- Formatting table -->
  <!--
  <xsl:attribute-set name="table.properties">
    <xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
    <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
  </xsl:attribute-set>
  -->
  
  <xsl:template name="table.row.properties">
    <xsl:variable name="tabstyle">
      <xsl:call-template name="tabstyle" />
    </xsl:variable>
  
    <xsl:variable name="bgcolor">
      <xsl:call-template name="dbfo-attribute">
        <xsl:with-param name="pis" select="processing-instruction('dbfo')" />
        <xsl:with-param name="attribute" select="'bgcolor'" />
      </xsl:call-template>
    </xsl:variable>
  
    <xsl:variable name="rownum">
      <xsl:number from="tgroup" count="row" />
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$bgcolor != ''">
        <xsl:attribute name="background-color">
          <xsl:value-of select="$bgcolor" />
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="$tabstyle = 'striped'">
        <xsl:if test="$rownum mod 2 = 0">
          <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
        </xsl:if>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="table.cell.block.properties">
    <xsl:if test="ancestor::thead">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="background-color">#DDDDDD</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-weight">
      <xsl:choose>
        <xsl:when test="self::table">bold</xsl:when>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="formal.object.properties">
    <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="default.table.frame">topbot</xsl:param>
  
  <!--Formatting header content -->
  <xsl:template name="header.content">
    <xsl:param name="pageclass" select="''" />
    <xsl:param name="sequence" select="''" />
    <xsl:param name="position" select="''" />
    <xsl:param name="gentext-key" select="''" />

    <fo:block>
      <!-- sequence: odd even, first, blank -->
      <!-- position: left, center, right -->
    
      <xsl:choose>
        <xsl:when test="$sequence = 'odd' and $position = 'left'">
          <fo:retrieve-marker retrieve-class-name="section.head.marker"
                              retrieve-position="first-including-carryover"
                              retrieve-boundary="page-sequence" />
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'center'">
          <xsl:call-template name="draft.text" />
        </xsl:when>
        <xsl:when test="$sequence = 'odd' and $position = 'right'">
          <fo:page-number />
        </xsl:when>
        
        <xsl:when test="$sequence = 'even' and $position = 'right'">
          <!-- <xsl:value-of select="ancestor-or-self::chapter/title" /> -->
          <xsl:apply-templates select="." mode="object.title.markup" />
        </xsl:when>
      
        <xsl:when test="$sequence = 'blank' and $position = 'center'">
          <xsl:text>This page intentionally left blank</xsl:text>
        </xsl:when>
      </xsl:choose>
    </fo:block>
  </xsl:template>
  
  <xsl:attribute-set name="header.content.properties">
    <xsl:attribute name="font-family">Tahoma, Arial, Helvetica, sans-serif</xsl:attribute>
    <xsl:attribute name="font-size">9pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:template name="head.sep.rule">
    <xsl:param name="pageclass" />
    <xsl:param name="sequence" />
    <xsl:param name="gentext-key" />
  
    <xsl:if test="$header.rule != 0">
      <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
      <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
      <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <!--Section Title Style -->
  <xsl:attribute-set name="section.title.level1.properties">
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="color">#0860A8</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="section.title.level2.properties">
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="color">#007AA0</xsl:attribute>
  </xsl:attribute-set>

  <!-- Graphics Options -->
  <xsl:param name="admon.graphics.path">Dist/pdf/images/docbook/</xsl:param>
  <xsl:param name="callout.graphics.path">Dist/pdf/images/docbook/callouts/</xsl:param>
  <xsl:param name="draft.watermark.image">Dist/pdf/images/docbook/draft.png</xsl:param>
  <xsl:param name="img.src.path">Dist/pdf/images/custom/</xsl:param>
  
</xsl:stylesheet>
