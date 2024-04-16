#!/bin/bash

echo "Create Container...";
docker run -d --name tuto_mvc_ctn \
-p 127.0.0.1:80:80 \
-v $(pwd)/app:/app \
tuto_php_lamp:latest;

echo "Copy my-site Config...";
docker cp my-site.conf tuto_mvc_ctn:/etc/apache2/sites-available;

echo "Enable my-site...";
docker exec tuto_mvc_ctn /bin/bash -c "a2dissite 000-default.conf";
docker exec tuto_mvc_ctn /bin/bash -c "a2ensite my-site.conf";

echo -e "\033[0;31m";
docker exec -w /etc/apache2/sites-enabled tuto_mvc_ctn /bin/bash -c "ls";
echo -e -n "\033[0m";

echo "Restart Container...";
docker restart tuto_mvc_ctn;

exit 0;
