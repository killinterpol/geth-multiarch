#!/bin/bash
set -e
image="killinterpol/geth-multiarch"

docker tag geth-multiarch $image:linux-$ARCH-$TRAVIS_TAG
docker push $image:linux-$ARCH-$TRAVIS_TAG
