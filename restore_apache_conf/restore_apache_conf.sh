#!/bin/bash

echo "Update Apache2 Config...";
docker cp apache2.conf tuto_php_ctn:/etc/apache2;

echo "Restart Container...";
docker restart tuto_php_ctn;

echo "Done";

exit 0;