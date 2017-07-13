FROM solr:5.5.4-alpine

MAINTAINER katherly@upenn.edu

EXPOSE 8983

RUN mkdir -p /opt/solr/server/solr/blacklight-core/conf

USER solr

COPY schema.xml /opt/solr/server/solr/blacklight-core/conf/schema.xml

COPY solrconfig.xml /opt/solr/server/solr/blacklight-core/conf/solrconfig.xml
