﻿<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns="http://docbook.org/ns/docbook"
  exclude-result-prefixes="db xi"
  version="1.0">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

  <xsl:template match="db:info" />
  <xsl:template match="db:refsynopsisdiv/db:title" />
  
  <xsl:template match="xi:include">
    <xsl:choose>
      <xsl:when test="@href='apifunchead.xml' or @href='apiversion.xml' or @href='bufferbindings.xml'">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:attribute name="href">
            <xsl:value-of select="concat('included/', @href)" />
          </xsl:attribute>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="." />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="db:refsect1">
    <refsection>
      <xsl:apply-templates />
    </refsection>
  </xsl:template>
  
  <xsl:template match="db:refsect1[@xml:id='Copyright']">
    <xi:include href="../khronoscopyright.xml" />
  </xsl:template>
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>