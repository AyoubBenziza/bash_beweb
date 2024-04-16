#!/bin/bash

docker exec -w /tmp mysql_ctn bash -c "mysqldump -uroot -pmysqlpw -B movie_db > backup.sql";

docker cp mysql_ctn:/tmp/backup.sql ./;

docker exec -w /tmp mysql_ctn bash -c "rm -f backup.sql";

backup_name=backup_$(date +%Y%m%d_%H%M%S).sql;
mv backup.sql $backup_name;

exit 0;
