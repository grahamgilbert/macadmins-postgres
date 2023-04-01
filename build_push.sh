#!/bin/bash

VERSION="15.2"

docker buildx create --name mybuilder --bootstrap --use

docker buildx build --push \
  --platform linux/arm64/v8,linux/amd64 \
  --tag grahamgilbert/postgres:latest \
  .

docker buildx build --push \
  --platform linux/arm64/v8,linux/amd64 \
  --tag grahamgilbert/postgres:${VERSION} \
  .