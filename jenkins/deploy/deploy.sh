#!/bin/bash

echo udemy_cicd > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth


PROD=/var/jenkins_home/workspace/Pipeline-Maven-Udemy/jenkins/deploy/prod

scp -i $PROD /tmp/.auth prod-user@54.92.174.22:/tmp/.auth
scp -i $PROD ./jenkins/deploy/publish prod-user@54.92.174.22:/tmp/publish
ssh -i $PROD prod-user@54.92.174.22 "/tmp/publish"