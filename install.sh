#!/usr/bin/env bash

files_path=/home/stage
tomcat_path=/home/stage/tomcat

${tomcat_path}/bin/shutdown.sh

rm -rf /home/stage/tomcat/webapps/home
rm /home/stage/tomcat/webapps/home.war

cp ${files_path}/home.war  ${tomcat_path}/webapps/

${tomcat_path}/bin/startup.sh

sleep 3

mv ${files_path}/cos-26Dec2008.jar ${tomcat_path}/webapps/home/WEB-INF/lib


