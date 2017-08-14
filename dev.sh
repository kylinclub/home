#!/usr/bin/env bash

srcPath=/home/michael/IdeaProjects/src/github.com/kylinclub/home
tomcatPath=/home/michael/Applications/tomcat

${tomcatPath}/bin/shutdown.sh

rm ${tomcatPath}/webapps/home.war
rm -rf ${tomcatPath}/webapps/home

cp ${srcPath}/target/home.war ${tomcatPath}/webapps/

${tomcatPath}/bin/startup.sh

sleep 3

cp ${srcPath}/lib/cos-26Dec2008.jar ${tomcatPath}/webapps/home/WEB-INF/lib