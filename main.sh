#! /bin/bash

set -e

VERSION="1.0.2"

source ./pika-build-config.sh

echo "$PIKA_BUILD_ARCH" > pika-build-arch

# Clone Upstream
mkdir -p pika-first-setup
cp -rvf ./* ./pika-first-setup/ || true
cd ./pika-first-setup/

# Get build deps
apt-get build-dep ./ -y
apt-get install curl -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | CARGO_HOME=/root/.cargo sh -s -- -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p pika-first-setup_"$VERSION" || echo "dh-make: Ignoring Last Error"
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
