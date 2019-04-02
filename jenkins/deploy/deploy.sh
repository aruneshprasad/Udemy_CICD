#!/bin/bash

echo udemy_cicd > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@35.173.139.80:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish prod-user@35.173.139.80:/tmp/publish
ssh -i /opt/prod prod-user@35.173.139.80 "/tmp/publish"