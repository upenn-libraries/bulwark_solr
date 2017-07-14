# Solr 5.5.4 for Bulwark

This repository contains a Dockerized Solr 5.5.4 instance for deployment of Bulwark.  It uses [oai4solr](https://github.com/IISH/oai4solr) to expose an OAI feed of objects in the repository, populating the feed from the Solr index.

## Deployment

1. Build the image
```
docker build . -t solr5_dev:latest
```
2. Spin up the container
```
docker-compose up
```

3. Inside the container, visit Core Admin in a browser and create a core called `blacklight-core`.


## Adding OAI metadata formats

See [oai4solr documentation on metadata formats](https://github.com/IISH/oai4solr/blob/6.x-1.0/README.md#the-listmetadataformats-verb).
