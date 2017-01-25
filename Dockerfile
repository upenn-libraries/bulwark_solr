FROM solr:5.3-alpine

MAINTAINER katherly@upenn.edu

EXPOSE 8983

RUN mkdir -p /opt/solr/server/solr/bl_hydra

RUN mkdir -p /opt/solr/server/solr/bl_hydra/conf

COPY schema.xml /opt/solr/server/solr/bl_hydra/conf/schema.xml

COPY solrconfig.xml /opt/solr/server/solr/bl_hydra/conf/solrconfig.xml
