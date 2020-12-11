# dclong/gitpod [@DockerHub](https://hub.docker.com/r/dclong/gitpod/) | [@GitHub](https://github.com/dclong/gitpod)

Docker image for use on GitPod.
It is not intended to be used elsewhere (even if you can).

## Prerequisite
You need to [install Docker](http://www.legendu.net/en/blog/docker-installation/) before you use this Docker image.

## Usage in Linux

```
docker run -it \
    --hostname gitpod \
    --log-opt max-size=50m \
    -p 3000:8000 \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v "$(pwd)":/workdir \
    -v "$(dirname $HOME)":/home_host \
    dclong/gitpod /scripts/sys/init.sh
```
