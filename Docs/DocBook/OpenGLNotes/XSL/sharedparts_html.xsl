<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="sharedparts.xsl" />

  <xsl:param name="html.stylesheet">css/style.css</xsl:param>
  <xsl:param name="admon.graphics.path">images/docbook/</xsl:param>
  <xsl:param name="callout.graphics.path">images/docbook/callouts/</xsl:param>
  <xsl:param name="img.src.path">images/custom</xsl:param>

  <xsl:param name="ulink.target">_new</xsl:param>
  
  <!--
  <xsl:param name="default.table.frame">border</xsl:param>
  -->

  <xsl:param name="ignore.image.scaling">1</xsl:param>

  <!--
  <xsl:param name="linenumbering.extension">1</xsl:param>
  <xsl:param name="table.borders.with.css">1</xsl:param>
  -->

  <xsl:template name="tr.attributes">
    <xsl:param name="row">.</xsl:param>
    <xsl:param name="rownum">0</xsl:param>

    <!-- <xsl:variable name="hasheaderrow">0</xsl:variable> -->

    <xsl:if test="ancestor::table/@tabstyle = 'safe_color_table'">
      <xsl:choose>
        <xsl:when test="($rownum &gt;= 2 and $rownum &lt;= 10) or
                        ($rownum &gt;= 21 and $rownum &lt;= 29) or
                        ($rownum &gt;= 40 and $rownum &lt;= 48) or
                        ($rownum &gt;= 59 and $rownum &lt;= 67) or
                        ($rownum &gt;= 78 and $rownum &lt;= 86) or
                        ($rownum &gt;= 97 and $rownum &lt;= 105)">
          <xsl:attribute name="style">color:white</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="style">color:black</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="ancestor::table/@tabstyle = 'striped'">
      <xsl:choose>
        <xsl:when test="ancestor::thead">
          <xsl:attribute name="class">headerrow</xsl:attribute>
          <!-- <xsl:variable name="hasheaderrow">1</xsl:variable> -->
        </xsl:when>
        <xsl:otherwise>
          <!--
          <xsl:if test="$hasheaderrow = 1">
            <xsl:param name="rownum">$rownum + 1</xsl:param>
          </xsl:if>
          -->
          <xsl:choose>
            <xsl:when test="$rownum mod 2 != 0">
              <xsl:attribute name="class">oddrow</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="class">evenrow</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>