<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ OAI4Solr exposes your Solr indexes by adding a OAI2 protocol handler.
  ~
  ~     Copyright (c) 2011-2014  International Institute of Social History
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     (at your option) any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program.  If not, see <http://www.gnu.org/licenses/>.
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                xmlns:saxon="http://saxon.sf.net/"
                exclude-result-prefixes="saxon">

  <!-- Demonstrate how a Solr response can be mapped into an oai_dc format.

  The header values are taken from stored Lucene index fields as set in the schema.xml document:

      header/identifier:
      <field name="identifier" type="string" indexed="true" stored="true" required="true"/>

      header/datestamp
      <field name="datestamp" type="date" indexed="true" stored="true" required="true" default="NOW"/>

      header/setSpec
      <field name="theme" type="string" indexed="true" stored="true" required="true" multiValued="true" />

  The metadata element is created by taking a data dump from one particular index field called 'resource'
  which is then mapped into dc. We use an XSLT 2 processor for this. -->

  <xsl:import href="oai.xsl"/>

  <xsl:template name="header">
    <header>
      <identifier>
        oai:localhost:<xsl:value-of select="$doc//str[@name='id']"/>
      </identifier>
      <datestamp>
        <xsl:call-template name="datestamp">
          <xsl:with-param name="solrdate" select="$doc//date[@name='timestamp']"/>
        </xsl:call-template>
      </datestamp>
      <xsl:for-each select="$doc//arr[@name='theme']/str">
        <setSpec>
          <xsl:value-of select="."/>
        </setSpec>
      </xsl:for-each>
    </header>
  </xsl:template>

  <xsl:template name="metadata">
    <metadata>
      <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">

        <xsl:for-each select="$doc//arr[@name='title_tesim']">
          <dc:title>
            <xsl:value-of select="."/>
          </dc:title>
        </xsl:for-each>

      </oai_dc:dc>
    </metadata>
  </xsl:template>

  <xsl:template name="about">
    just stuff about our stuff
  </xsl:template>

</xsl:stylesheet>