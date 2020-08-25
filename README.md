 # terraform-sandbox-docker

## Deploying to Docker Hub

(until we automate it)

```
docker login
```

```
docker build . -t formidable/terraform-sandbox:{tagname}
docker push formidable/terraform-sandbox:{tagname}
```
Where `{tagname}` is a semver for example `0.0.1`.
