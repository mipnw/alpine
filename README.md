[![Docker Build Status](https://img.shields.io/docker/cloud/build/mipnw/alpine)](https://hub.docker.com/r/mipnw/alpine)
[![Docker Pulls](https://img.shields.io/docker/pulls/mipnw/alpine)](https://hub.docker.com/r/mipnw/alpine)

# [mipnw/alpine](https://github.com/mipnw/alpine)

Develop more easily on alpine with docker image [mipnw/alpine](https://hub.docker.com/r/mipnw/alpine).
* Run with the same user:group inside the container as on your host. 
* Prompt coloring, aliases etc.. same as on your host, for bash users

Run `make shell` and start developing. By setting environment variable DOCKER_USER_PATH to the path of your .bashrc before calling `make shell`, you'll automatically have your aliases, prompt formatting, bash functions etc... in the docker container, just like if you were developing on your host.

Not running as root inside docker allows you to mount host volumes into the container, create files while in the container that you can edit/delete easily from the host. Otherwise you end up with files that you don't have permission to edit/delete on the host, this avoids constantly having to `chown $(id -nu):$(id -ng) [the new file]` on the host.

It gets more interesting if you add docker layers on top of this image. You can define your own development environment on top of mipnw/alpine-base, for say Golang, Elixr, C++, by adding starting your Dockerfile with `FROM mipnw/alpine:latest` and adding the relevant packages with `apk add`.