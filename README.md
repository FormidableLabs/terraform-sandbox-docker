 # terraform-sandbox-docker

`docker pull formidable/terraform-sandbox`

https://hub.docker.com/repository/docker/formidable/terraform-sandbox

## Deploying to Docker Hub

(until we automate it)

```
docker login
```

```
docker build . -t formidable/terraform-sandbox:latest
docker push formidable/terraform-sandbox:latest
docker tag formidable/terraform-sandbox:latest formidable/terraform-sandbox:{tagname}
docker push formidable/terraform-sandbox:{tagname}
```
Where `{tagname}` is a semver for example `0.0.1`.

So we are deploying one image and marking it as `latest` and with a semver.


## Maintenance Status

**Archived:** This project is no longer maintained by Formidable. We are no longer responding to issues or pull requests unless they relate to security concerns. We encourage interested developers to fork this project and make it their own!
