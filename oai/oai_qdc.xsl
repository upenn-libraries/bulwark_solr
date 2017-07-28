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
      <oai_qdc:qualifieddc xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
                           xmlns:dcterms="http://purl.org/dc/terms/"
                           xmlns:dc="http://purl.org/dc/elements/1.1/"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                           xsi:schemaLocation="http://worldcat.org/xmlschemas/qdc-1.0/
                           http://worldcat.org/xmlschemas/qdc/1.0/qdc-1.0.xsd
                           http://purl.org/net/oclcterms
                           http://worldcat.org/xmlschemas/oclcterms/1.4/oclcterms-1.4.xsd">


      <xsl:for-each select="$doc//arr[@name='title_tesim']/str">
          <dcterms:title>
            <xsl:value-of select="."/>
          </dcterms:title>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='unique_identifier_tesim']/str">
          <dcterms:identifier>
            <xsl:value-of select="."/>
          </dcterms:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='identifier_tesim']/str">
          <dcterms:identifier>
            <xsl:value-of select="."/>
          </dcterms:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='display_call_number_tesim']/str">
          <dcterms:identifier>
            <xsl:value-of select="."/>
          </dcterms:identifier>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='creator_tesim']/str">
          <dcterms:creator>
            <xsl:value-of select="."/>
          </dcterms:creator>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='author_name_tesim']/str">
          <dcterms:creator>
            <xsl:value-of select="."/>
          </dcterms:creator>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='contributor_tesim']/str">
          <dcterms:contributor>
            <xsl:value-of select="."/>
          </dcterms:contributor>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='description_tesim']/str">
          <dcterms:extent>
            <xsl:value-of select="."/>
          </dcterms:extent>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='abstract_tesim']/str">
          <dcterms:description>
            <xsl:value-of select="."/>
          </dcterms:description>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='subject_tesim']/str">
          <dcterms:subject>
            <xsl:value-of select="."/>
          </dcterms:subject>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='relation_tesim']/str">
          <dcterms:relation>
            <xsl:value-of select="."/>
          </dcterms:relation>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='collection_tesim']/str">
          <dcterms:isPartOf>
            <xsl:value-of select="."/>
          </dcterms:isPartOf>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='rights_tesim']/str">
          <dcterms:rights>
            <xsl:value-of select="."/>
          </dcterms:rights>
          <xsl:if test="not($doc//arr[@name='rights_tesim']/str)">
            <dc:rights>https://creativecommons.org/publicdomain/mark/1.0/</dc:rights>
          </xsl:if>
        </xsl:for-each>
        <dcterms:rightsholder>University of Pennsylvania Libraries</dcterms:rightsholder>

        <xsl:for-each select="$doc//arr[@name='coverage_tesim']/str">
          <dcterms:spatial>
            <xsl:value-of select="."/>
          </dcterms:spatial>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='language_tesim']/str">
          <dcterms:language>
            <xsl:value-of select="."/>
          </dcterms:language>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='source_tesim']/str">
          <dcterms:source>
            <xsl:value-of select="."/>
          </dcterms:source>
        </xsl:for-each>

        <dcterms:publisher>University of Pennsylvania Libraries</dcterms:publisher>
        <xsl:for-each select="$doc//arr[@name='publisher_tesim']/str">
          <dcterms:publisher>
            <xsl:value-of select="."/>
          </dcterms:publisher>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='date_tesim']/str">
          <dcterms:date>
            <xsl:value-of select="."/>
          </dcterms:date>
        </xsl:for-each>

        <xsl:for-each select="$doc//arr[@name='item_type_tesim']/str">
          <dcterms:type>
            <xsl:value-of select="."/>
          </dcterms:type>
        </xsl:for-each>

      </oai_qdc:qualifieddc>
    </metadata>
  </xsl:template>

</xsl:stylesheet>