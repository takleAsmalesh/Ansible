# step 1:
  ARG JENKINS_IMAGE=docker.io/jenkins/jenkins
  ARG JENKINS_TAG=lts
  FROM "${JENKINS_IMAGE}:${JENKINS_TAG}"
  # step 2:
  USER root
  RUN curl -fsSL https://get.docker.com | sh
  RUN apt-get update && \
      apt-get install -y sudo && \
      rm -rf /var/lib/apt/lists/*
  RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
  # step 3:
  RUN usermod -aG docker jenkins
  # step 4:
  ARG HOST_DOCKER_GID
  RUN groupmod -g "$HOST_DOCKER_GID" docker
  # step 5:
  USER jenkins
