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

        <xsl:for-each select="$doc//arr[@name='unique_identifier_tesim']">
          <dc:identifier>
            <xsl:value-of select="."/>
          </dc:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='identifier_tesim']">
          <dc:identifier>
            <xsl:value-of select="."/>
          </dc:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='display_call_number_tesim']">
          <dc:identifier>
            <xsl:value-of select="."/>
          </dc:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='creator_tesim']">
          <dc:creator>
            <xsl:value-of select="."/>
          </dc:creator>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='author_name_tesim']">
          <dc:creator>
            <xsl:value-of select="."/>
          </dc:creator>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='contributor_tesim']">
          <dc:contributor>
            <xsl:value-of select="."/>
          </dc:contributor>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='description_tesim']">
          <dc:description>
            <xsl:value-of select="."/>
          </dc:description>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='abstract_tesim']">
          <dc:description>
            <xsl:value-of select="."/>
          </dc:description>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='subject_tesim']/str">
          <dc:subject>
            <xsl:value-of select="."/>
          </dc:subject>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='relation_tesim']">
          <dc:relation>
            <xsl:value-of select="."/>
          </dc:relation>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='collection_tesim']">
          <dc:relation>
            <xsl:value-of select="."/>
          </dc:relation>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='rights_tesim']">
          <dc:rights>
            <xsl:value-of select="."/>
          </dc:rights>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='coverage_tesim']">
          <dc:coverage>
            <xsl:value-of select="."/>
          </dc:coverage>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='language_tesim']">
          <dc:language>
            <xsl:value-of select="."/>
          </dc:language>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='source_tesim']">
          <dc:source>
            <xsl:value-of select="."/>
          </dc:source>
        </xsl:for-each>

        <dc:publisher>University of Pennsylvania Libraries</dc:publisher>
        <xsl:for-each select="$doc//arr[@name='publisher_tesim']">
          <dc:publisher>
            <xsl:value-of select="."/>
          </dc:publisher>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='date_tesim']">
          <dc:date>
            <xsl:value-of select="."/>
          </dc:date>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='item_type_tesim']">
          <dc:type>
            <xsl:value-of select="."/>
          </dc:type>
        </xsl:for-each>

      </oai_dc:dc>
    </metadata>
  </xsl:template>

</xsl:stylesheet>