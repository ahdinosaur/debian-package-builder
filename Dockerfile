ARG ARCH

FROM multiarch/debian-debootstrap:${ARCH}-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
  apt-get -y install \
    git curl gnupg \
    libc6-dev build-essential libtool \
    debhelper devscripts \
    && \
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_10.x buster main" | tee /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_10.x buster main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
  apt-get -y update && \
  apt-get -y install nodejs && \
  rm -rf /var/lib/apt/lists/*

COPY ./build /app/

VOLUME ["/app/input", "/app/output"]
