#!/usr/bin/env bash

mvn clean
mvn compile
mvn package

scp target/home.war lib/cos-26Dec2008.jar install.sh root@120.92.10.182:/home/stage `chmod +x install.sh`

