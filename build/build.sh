#!/usr/bin/env bash

docker build -t trsenna/vscodedevimages-foundation -f foundation/Dockerfile foundation
docker build -t trsenna/vscodedevimages-foundation:base -f foundation/base.Dockerfile foundation
docker build -t trsenna/vscodedevimages-foundation:core -f foundation/core.Dockerfile foundation
docker build -t trsenna/vscodedevimages-node:14 -f images/node14.Dockerfile images
docker build -t trsenna/vscodedevimages-php:7.4 -f images/php74.Dockerfile images
