#!/bin/bash
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -


cat /etc/issue
echo "=>Votre distrib Ubuntu (1) Debian (2)"
read distrib
if [ $distrib == 1 ]
then
    echo "  --> Votre version Ubuntu -> 20.04 Focal (1) -> 18.04 Bionic (2) -> 16.04 Xenial (2)"
    read version
    if [ $version == 1 ]
    then
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    elif [ $version == 2 ]
    then
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    elif [ $version == 3 ]
    then
       echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    fi

elif [ $distrib == 2 ]
then
    echo "  -->Votre version Debian -> 9 Stretch (1) -> 10 Buster (2)"
    read version
    if [ $version == 1 ]
    then
        echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    elif [ $version == 2 ]
    then
        echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    fi
else
    echo "ok"
fi

sudo apt-get update

sudo apt-get install -y mongodb-org 

echo "=> Installation PHP MongoDB Driver "
sudo apt-get install php-dev
sudo apt-get install php-xml
sudo pecl install mongodb
echo "extension=mongodb.so" >> /etc/php/7.3/apache2/php.ini
composer require mongodb/mongodb