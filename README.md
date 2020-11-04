# Docker image for Solr 5 for Colenda

Stub readme for Dockerized Solr 5.3 instance for initial deployment of Colenda

## How to use

1. Build the image
```bash
docker build . -t colenda_solr:latest
```
2. Spin up the container.
```bash
docker-compose up
```

3. Inside the container, visit Core Admin in a browser and create a core called `blacklight-core`.
