#!/bin/bash
export DOCKER_CLI_EXPERIMENTAL=enabled

set -e
image="killinterpol/geth-multiarch"

docker tag geth-multiarch $image:linux-$ARCH-$TRAVIS_TAG
docker push $image:linux-$ARCH-$TRAVIS_TAG

if [ "$ARCH" == "amd64" ]; then
  docker manifest create killinterpol/geth-multiarch:latest \
    killinterpol/geth-multiarch:linux-arm-$TRAVIS_TAG \
    killinterpol/geth-multiarch:linux-arm64-$TRAVIS_TAG \
    killinterpol/geth-multiarch:linux-amd64-$TRAVIS_TAG\

  docker manifest inspect killinterpol/geth-multiarch:latest
  docker manifest push killinterpol/geth-multiarch:latest
fi
