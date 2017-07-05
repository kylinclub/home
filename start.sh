#!/usr/bin/env bash

cd ~/Applications/tomcat/

./bin/shutdown.sh

rm ./webapps/home.war
rm -rf ./webapps/home

cp /Users/michael/workSpaces/home/target/home.war ./webapps/

./bin/startup.sh