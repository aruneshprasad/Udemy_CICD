#!/bin/bash

echo udemy_cicd > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth


PROD=/var/jenkins_home/workspace/Pipeline-Maven-Udemy/jenkins/deploy/prod

scp -i $PROD /tmp/.auth prod-user@35.173.139.80:/tmp/.auth
scp -i $PROD ./jenkins/deploy/publish prod-user@35.173.139.80:/tmp/publish
ssh -i $PROD prod-user@35.173.139.80 "/tmp/publish"