#!/bin/bash

echo "***************************"
echo "** Testing the code ***********"
echo "***************************"

WORKSPACE=/home/ec2-user/jenkins/jenkins_data/workspace/Pipeline-Maven-Udemy

docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
