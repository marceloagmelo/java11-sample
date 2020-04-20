#!/usr/bin/env bash

source setenv.sh

echo "Criando imagem $DOCKER_REGISTRY/$CONTAINER_NAME-$JAVA_VERSION"
docker build -t $DOCKER_REGISTRY/$CONTAINER_NAME-$JAVA_VERSION .
