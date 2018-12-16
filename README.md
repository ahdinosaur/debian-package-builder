# debian-package-builder

build Node.js (and other) scripts into Debian packages (optionally using Docker for cross-compilation environment)

## background

i want to port [Scuttlebutt](https://scuttlebutt.nz) to Debian packages for [Peach Cloud](http://peachcloud.org), to use on Intel or Arm Linux devices 

## example

with Docker installed:

```
git clone https://github.com/ahdinosaur/debian-package-builder
cd debian-package-builder
npm run example:hello-node:amd64
sudo dpkg -i output/hello-node/hello-node.0.0_amd64.deb

# or to cross-compile for armhf
npm run example:hello-node:armhf

# or to cross-compile for arm64
npm run example:hello-node:arm64
```

see more example inputs in [`./examples`](./examples)

## install

```
npm install -g debian-package-builder
```

## usage

```
Usage:
  debian-package-builder [options]

  Arguments:

    -t, --target <target>: (required) target of build (nodejs)
    -i, --input <path>: (required) directory of input image spec
    -o, --output <path>: (required) directory to output build results
    -a, --arch <arch>: (required) architecture
    -n, --name <name>: optional name of image

  Flags:

    -h, --help: show this usage
    -d, --docker: build image using docker

  Docker-only arguments:

    --debian-release <release>: optional Debian release (default: buster) 
    --target-version <version>: optional target version
      - default Node.js version: 10
    --apt-proxy <address>: optional apt proxy

  Examples:

    debian-package-builder --docker --target nodejs --input ./examples/hello-world --output ./output --arch amd64
```

if using `--docker`, you need Docker installed.

if not using `--docker`, you need the following packages installed:

- `git`
- `curl`
- `gnupg`
- `libc6-dev`
- `build-essential`
- `libtool`
- `debhelper`
- `devscripts`

if intended target is `nodejs`, you also need:

- `nodejs` (preferably from [NodeSource](https://github.com/nodesource/distributions#deb))

## references

- https://blog.cloudflare.com/porting-our-software-to-arm64/
- https://www.ecliptik.com/Cross-Building-and-Running-Multi-Arch-Docker-Images/
- https://askubuntu.com/questions/850568/how-do-i-represent-arch-pc-linux-gnu-in-a-debian-install-file
- https://packages.debian.org/sid/qemu-user-static
- https://www.debian.org/doc/manuals/maint-guide/start.en.html
- https://www.debian.org/doc/debian-policy/index.html#
- https://github.com/mafintosh/raspberry-pi-container

## license

GPL-3.0
