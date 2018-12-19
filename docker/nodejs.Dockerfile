ARG ARCH
ARG DEBIAN_RELEASE

FROM debian-package-builder:${ARCH}-${DEBIAN_RELEASE}

ARG DEBIAN_RELEASE
ARG TARGET_VERSION

RUN \
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_${TARGET_VERSION}.x ${DEBIAN_RELEASE} main" | tee /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_${TARGET_VERSION}.x ${DEBIAN_RELEASE} main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
  apt-get -y update && \
  apt-get -y --no-install-recommends install nodejs && \
  rm -rf /var/lib/apt/lists/*

ARG CACHE

RUN test "${CACHE}" = "y" && \
  npm config set proxy http://172.17.0.1:3143/ && \
  npm config set https-proxy http://172.17.0.1:3143/ && \
  npm config set strict-ssl false \
  || true
