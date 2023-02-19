#!/bin/bash

# Pre requirements
ORI_PWD=$(pwd)
cd "$(dirname "$0")"
bash ../Common/CreateBuilder.sh

# Setup
IMAGE_NAME="hegerdes/vscode-latex"
PLATFORMS="linux/amd64,linux/arm64,linux/arm/v7"
VARIANTS=(debian:bullseye-slim ubuntu:focal)
LANGUAGES=(all arabic chinese cjk cyrillic czechslovak english european french german greek italian japanese korean other polish portuguese spanish)
DO_PUSH=""
PANDOC_DOWNLOAD_URL="https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.16.2-1-amd64.deb"

#Set CWD
cd "$(dirname "$0")"
if [[ $1 == "push" ]]; then
    echo "Will build amd64 and push to dockerhub"
    DO_PUSH="--push"
fi

# Build base
for VARIANT in ${VARIANTS[@]}; do
    VARIANT_BUILD_TAG=(${VARIANT//:/ })
    VARIANT_NAME_TAG=(${VARIANT_BUILD_TAG[1]//-/ })
    echo "Building ${IMAGE_NAME}:${VARIANT_NAME_TAG[1]}..."
    # docker buildx build --cache-from type=local,src=/tmp/docker-cache --cache-to=type=local,dest=/tmp/docker-cache,mode=max --platform $PLATFORMS --pull --build-arg VARIANT=$VARIANT --build-arg PANDOC_URL=$PANDOC_DOWNLOAD_URL -f "Dockerfile.base" -t $IMAGE_NAME:${VARIANT_NAME_TAG[1]} $DO_PUSH .
done

# Build/tag latest
docker buildx build --cache-from type=local,src=/tmp/docker-cache --cache-to=type=local,dest=/tmp/docker-cache,mode=max --platform $PLATFORMS --pull --build-arg VARIANT=debian:bullseye-slim --build-arg PANDOC_URL=$PANDOC_DOWNLOAD_URL -f "Dockerfile.base" -t $IMAGE_NAME:latest $DO_PUSH .

# Build slim
VARIANTS=(debian:bullseye-slim ubuntu:focal)
for VARIANT in ${VARIANTS[@]}; do
    VARIANT_BUILD_TAG=(${VARIANT//:/ })
    VARIANT_NAME_TAG=(${VARIANT_BUILD_TAG[1]//-/ })
    echo "Building ${IMAGE_NAME}:${VARIANT_NAME_TAG[0]}-slim..."
    docker buildx build --cache-from type=local,src=/tmp/docker-cache --cache-to=type=local,dest=/tmp/docker-cache,mode=max --platform $PLATFORMS --pull --build-arg VARIANT=$VARIANT -f "Dockerfile.base-slim" -t $IMAGE_NAME:${VARIANT_NAME_TAG[0]}-slim $DO_PUSH .
done

# Build language variants
for VARIANT in ${VARIANTS[@]}; do
    for LANG in ${LANGUAGES[@]}; do
        echo "Building ${IMAGE_NAME}:${VARIANT}-lang-${LANG}..."
        docker buildx build --platform $PLATFORMS --build-arg VARIANT=$VARIANT --build-arg LANG=$LANG -f "Dockerfile.language" -t $IMAGE_NAME:${VARIANT}-lang-$LANG $DO_PUSH .
    done
done

# Build full
for VARIANT in ${VARIANTS[@]}; do
    echo "Building ${IMAGE_NAME}:${VARIANT}-full..."
    docker build --build-arg VARIANT=$VARIANT -f "Dockerfile.full" -t $IMAGE_NAME:${VARIANT}-full .
done

cd $ORI_PWD