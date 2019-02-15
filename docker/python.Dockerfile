ARG ARCH
ARG DEBIAN_RELEASE

FROM debian-package-builder:${ARCH}-${DEBIAN_RELEASE}

ARG DEBIAN_RELEASE

RUN \
  apt-get -y update && \
  apt-get -y --no-install-recommends install \
    dh-python \
    python-all python-setuptools \
    python3-all python3-setuptools \
    && \
  rm -rf /var/lib/apt/lists/*
