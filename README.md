# Docker image for Solr 5 for Colenda

Stub readme for Dockerized Solr 5.5.4 instance for deployment of Colenda

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
