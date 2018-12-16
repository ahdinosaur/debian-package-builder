ARG ARCH
ARG DEBIAN_RELEASE

FROM multiarch/debian-debootstrap:${ARCH}-${DEBIAN_RELEASE}-slim

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get -y update && \
  apt-get -y --no-install-recommends install \
    git curl gnupg \
    libc6-dev build-essential libtool \
    debhelper devscripts \
    && \
  rm -rf /var/lib/apt/lists/*

COPY ./build /app/

VOLUME ["/app/input", "/app/output"]
