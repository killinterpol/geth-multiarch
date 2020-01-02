#!/bin/bash
set -e

image="killinterpol/geth-multiarch"

docker tag geth-multiarch "$image:linux-$ARCH-$TRAVIS_TAG"
docker push "$image:linux-$ARCH-$TRAVIS_TAG"

if [ "$ARCH" == "amd64" ]; then
  docker manifest create killinterpol/geth-multiarch:latest \
    killinterpol/geth-multiarch:linux/amd64 \
    killinterpol/geth-multiarch:linux/arm \
    killinterpol/geth-multiarch:linux/arm64

  docker manifest inspect killinterpol/geth-multiarch:latest

  docker manifest push killinterpol/geth-multiarch:latest
fi
