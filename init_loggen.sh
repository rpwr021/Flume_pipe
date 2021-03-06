#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
export PATH=${PATH}:${JAVA_HOME}/bin

export CLASSPATH=${HOME}/NonClut/gitwrk/Flume_pipe/log4j-1.2.17.jar:${HOME}/NonClut/gitwrk/Flume_pipe/

rm -f /tmp/LOGgen.log

dkrurl=`sudo docker inspect -f  '{{json .}}' 4094074d | jshon  -e NetworkSettings -e IPAddress | sed -e 's/"//g'`

if nc -zv $dkrurl 9000 ; then
	java logGen $1
else 
	echo "docker container isn't up ?,
	trying to start"
	 
	docker run -p 9000:9000 -it sequenceiq/hadoop-docker:2.6.0.V1 /etc/bootstrap.sh -bash

fi

#docker run   -e FLUME_AGENT_NAME=agentx  -e FLUME_CONF_FILE=${HOME}/NonClut/gitwrk/Flume_pipe/Simple_flumeLogr.conf


#${HOME}/NonClut/flume/bin/flume-ng agent -c conf -f ~/NonClut/gitwrk/Flume_pipe/loglistener.conf -n loglistener
#${HOME}/NonClut/flume/bin/flume-ng agent -c conf -f ~/NonClut/gitwrk/Flume_pipe/logwriter.conf -n logwriter


