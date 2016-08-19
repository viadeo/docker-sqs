#!/bin/bash
cd /elasticmq
java -jar -Dlogback.configurationFile=my_logback.xml -Dconfig.file=/elasticmq/config/custom.conf elasticmq-server-0.9.3.jar
