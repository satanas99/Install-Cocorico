#!/bin/bash
echo "-> Activation de curl..."
sed -i "3i\extension=curl.so\n" /etc/php/7.3/apache2/php.ini
sleep 1
echo "-> Activation de intl..."
sed -i "3i\extension=intl.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.3
echo "-> Activation de fileinfo..."
sed -i "3i\extension=fileinfo.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.8
echo "-> Activation de openssl..."
sed -i "3i\extension=openssl.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.5
echo "-> Activation de soap..."
sed -i "3i\extension=soap.so\n" /etc/php/7.3/apache2/php.ini
sleep 1
echo "-> Activation de exif..."
sed -i "3i\extension=exif.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.4
echo "-> Activation de imagick..."
sed -i "3i\extension=imagick.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.2
echo "-> Activation de pdo_sqlite..."
sed -i "3i\extension=pdo_sqlite.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.1
echo "-> Activation de pdo_mysql..."
sed -i "3i\extension=pdo_mysql.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.6
echo "-> Activation de opcache..."
sed -i "3i\extension=opcache.so\n" /etc/php/7.3/apache2/php.ini
echo "-> Activation de apcu..."
sed -i "3i\extension=apcu.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.7
echo "-> Activation de zip..."
sed -i "3i\extension=zip.so\n" /etc/php/7.3/apache2/php.ini
sleep 1
echo "-> Activation de sockets..."
sed -i "3i\extension=sockets.so\n" /etc/php/7.3/apache2/php.ini
sleep 0.2
echo "=> Activation des extentions terminer"