#!/usr/bin/env bash

cd ~/Applications/tomcat/

./bin/shutdown.sh

rm ./webapps/home.war
rm -rf ./webapps/home

cp /Users/michael/workSpaces/home/target/home.war ./webapps/

./bin/startup.sh

sleep 3

cp /Users/michael/workSpaces/home/lib/cos-26Dec2008.jar /Users/michael/Applications/tomcat/webapps/home/WEB-INF/lib