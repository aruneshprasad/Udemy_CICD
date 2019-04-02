#!/bin/bash

echo udemy_cicd > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

sudo chown 500:500 ~/jenkins/jenkins_data/ -R
cp ~/prod /home/ec2-user/jenkins/jenkins_data/workspace/Pipeline-Maven-Udemy/jenkins/deploy/
sudo chown 1000:1000 ~/jenkins/jenkins_data/ -R

PROD=/var/jenkins_home/workspace/Pipeline-Maven-Udemy/jenkins/deploy/prod

scp -i $PROD /tmp/.auth prod-user@35.173.139.80:/tmp/.auth
scp -i $PROD ./jenkins/deploy/publish prod-user@35.173.139.80:/tmp/publish
ssh -i $PROD prod-user@35.173.139.80 "/tmp/publish"