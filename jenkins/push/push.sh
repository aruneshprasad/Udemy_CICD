#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="udemy_cicd"

echo "** Logging in ***"
docker login -u aruneshpd -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG aruneshpd/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push aruneshpd/$IMAGE:$BUILD_TAG
