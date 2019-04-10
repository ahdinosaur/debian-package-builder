ARG ARCH
ARG DEBIAN_RELEASE

FROM multiarch/debian-debootstrap:${ARCH}-${DEBIAN_RELEASE}-slim

ARG CACHE

RUN \
  test "${CACHE}" = "y" && \
  echo 'Acquire::HTTP::Proxy "http://172.17.0.1:3142";' >> /etc/apt/apt.conf.d/01proxy && \
  echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy \
  || true

RUN \
  apt-get -y update && \
  apt-get -y --no-install-recommends install \
    git curl gnupg ca-certificates \
    libc6-dev build-essential libtool \
    debhelper devscripts fakeroot equivs \
    && \
  rm -rf /var/lib/apt/lists/*

ARG DEBIAN_RELEASE
RUN \
  test "${DEBIAN_RELEASE}" = "stretch" && \
  echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
  apt-get -y update && \
  apt-get -t stretch-backports -y --no-install-recommends install debhelper \
  || true

COPY ./build /app/

VOLUME ["/app/input", "/app/output"]
