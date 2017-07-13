FROM solr:5.5.4-alpine

MAINTAINER katherly@upenn.edu

EXPOSE 8983

RUN mkdir -p /opt/solr/server/solr/blacklight-core/conf

USER solr

COPY schema.xml /opt/solr/server/solr/blacklight-core/conf/schema.xml

COPY solrconfig.xml /opt/solr/server/solr/blacklight-core/conf/solrconfig.xml

COPY oai /opt/solr/server/solr/oai

COPY oai2-plugin-5.1.jar /opt/solr/server/solr/lib/oai2-plugin-5.1.jar