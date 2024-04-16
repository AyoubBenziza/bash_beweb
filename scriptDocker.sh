#!/bin/bash
#######################################################

docker run -d --name asterix_ctn \
-p 127.0.0.1:3308:3306 \
-e MYSQL_ROOT_PASSWORD=mysqlpw \
-e MYSQL_USER=asterix \
-e MYSQL_PASSWORD=asterixpw \
-e MYSQL_DATABASE=asterix_db \
mysql:latest;

#######################################################
exit 0;