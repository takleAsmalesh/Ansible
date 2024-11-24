#!/bin/sh
cat << EOF > .env
JENKINS_IMAGE=docker.io/jenkins/jenkins
JENKINS_TAG=lts  # see tags here: https://hub.docker.com/r/jenkins/jenkins/tags
HOST_DOCKER_GID=$(getent group docker | cut -d ":" -f 3)
JENKINS_PORT=8080
EOF