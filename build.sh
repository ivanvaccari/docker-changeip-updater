#!/bin/bash
TAG=1.0.1

# AMD64 arch builder
docker build --rm --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg OS=buster-slim \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile \
    --tag ivaccari/changeip-updater:$TAG .
