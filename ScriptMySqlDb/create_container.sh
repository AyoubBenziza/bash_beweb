#!/bin/bash
################################################################################
# Create MySQL container
echo "Tapez le nom de votre container";
read nom_ctn;

echo "Tapez le mot de passe du root";
read mdp_root;

echo "Tapez le nom d'utilisateur";
read name_user;

echo "Tapez le mot de passe d'utilisateur";
read mdp_user;

echo "Tapez le nom de votre base de données";
read name_db;

echo "Tapez le nom du container phpmyadmin";
read nom_pma;

echo "Tapez le nom de l'hote du container phpmyadmin";
read nom_dbhost;

docker run -d --name $nom_ctn \
-p 127.0.0.1:3307:3306 \
-e MYSQL_ROOT_PASSWORD=$mdp_root \
-e MYSQL_USER=$name_user \
-e MYSQL_PASSWORD=$mdp_user \
-e MYSQL_DATABASE=$name_db \
mysql:latest;

# ------------------------------------------------------------

echo "Waiting for container stabilisation..."; sleep 30;

docker cp $@ $nom_ctn:/tmp;

docker exec -w /tmp $nom_ctn bash -c "mysql -u$name_user -p$mdp_user -B $name_db < $@";

docker exec -w /tmp $nom_ctn bash -c "rm -f $@";

# ------------------------------------------------------------
# Create PHPMyAdmin container
docker run -d --name $nom_pma \
-p 127.0.0.1:82:80 \
--link $nom_ctn:$nom_dbhost \
-e PMA_HOST=$nom_dbhost \
-e PMA_PORT=3306 \
phpmyadmin/phpmyadmin:latest;

################################################################################
exit 0;
