# Docker image for react native.

FROM node:6

ENV maintainer="Paul Desmond Parker"


# Setup environment variables
ENV PATH $PATH:node_modules/.bin

# Install add-apt-repository
# RUN apt-get install -q software-properties-common python-software-properties
RUN echo "deb http://http.debian.net/debian jessie-backports main" | \
      tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null

# Install Java
# RUN add-apt-repository ppa:openjdk-r/ppa -q && \
RUN apt-get update -q && \
    apt-get install -qy --no-install-recommends python-dev && \
    apt-get install -qy --no-install-recommends -t jessie-backports openjdk-8-jdk


# Install EXPO
RUN npm install -g expo-cli

## Clean up when done
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean

# Default react-native web server port
EXPOSE 8081

# User creation
ENV USERNAME dev

RUN adduser --disabled-password --gecos '' $USERNAME

# Add Tini
ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

USER $USERNAME

# Set workdir
# You'll need to run this image with a volume mapped to /home/dev (i.e. -v $(pwd):/home/dev) or override this value
WORKDIR /home/$USERNAME/app

# Tell gradle to store dependencies in a sub directory of the android project
# this persists the dependencies between builds
ENV GRADLE_USER_HOME /home/$USERNAME/app/android/gradle_deps

ENTRYPOINT ["/tini", "--"]
