ARG ARCH
ARG DEBIAN_RELEASE

FROM multiarch/debian-debootstrap:${ARCH}-${DEBIAN_RELEASE}-slim

ARG ARCH
ARG DEBIAN_RELEASE

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get -y update && \
  apt-get -y --no-install-recommends install \
    git curl gnupg \
    libc6-dev build-essential libtool \
    debhelper devscripts \
    && \
  rm -rf /var/lib/apt/lists/*

ARG NODE_VERSION

RUN \
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_${NODE_VERSION}.x ${DEBIAN_RELEASE} main" | tee /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION}.x ${DEBIAN_RELEASE} main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
  apt-get -y update && \
  apt-get -y --no-install-recommends install nodejs && \
  rm -rf /var/lib/apt/lists/*

COPY ./build /app/

VOLUME ["/app/input", "/app/output"]
