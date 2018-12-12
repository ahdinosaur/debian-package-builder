# debian-nodejs-package-builder

build Node.js scripts into Debian packages (optionally using Docker for cross-compilation environment)

## background

i want to port [Scuttlebutt](https://scuttlebutt.nz) to Debian packages for [Peach Cloud](http://peachcloud.org), to use on Intel or Arm Linux devices 

## example

with Docker installed:

```
git clone --recursive https://github.com/ahdinosaur/debian-nodejs-package-builder
cd debian-nodejs-package-builder
git submodule update --init --recursive
npm run example:hello-world:amd64
sudo dpkg -i output/hello-world/hello-world_1.0.0_amd64.deb

# or to cross-compile for armhf
npm run example:hello-world:armhf

# or to cross-compile for arm64
npm run example:hello-world:arm64
```

see more example inputs in [`./examples`](./examples)

## install

```
npm install -g debian-nodejs-package-builder
```

## usage

```
Usage:
  debian-nodejs-package-builder [options]

  Arguments:

    --arch <arch>: architecture
    --input <path>: required directory of input image spec
    --output <path>: required directory to output build results
    --name <name>: optional name of image

  Flags:

    -h, --help: show this usage
    -d, --docker: build image using docker

  Examples:

    debian-nodejs-package-builder --docker --input ./examples/hello-world --output ./output
```

if using `--docker`, you need Docker installed.

if not using `--docker`, you need the following packages installed:

- `node` (preferably from [NodeSource](https://github.com/nodesource/distributions#deb))
- `git`
- `curl`
- `gnupg`
- `libc6-dev`
- `build-essential`
- `libtool`
- `debhelper`
- `devscripts`

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
