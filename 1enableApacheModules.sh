#!/bin/bash
echo "=> Activation des modules apache"
echo "  -> Activation module headers"
sudo a2enmod headers
echo "  -> Activation module rewrite"
sudo a2enmod rewrite
echo "  -> Activation module ssl"
sudo a2enmod ssl


#http=0
#while [$http != 1] || [$http != 2]
#do
    #echo "Http (1) ou Https (2)"
    #read http
#done

echo "Http (1) ou Https (2)"
read http

if [ http == 1 ]
then
    echo "  <VirtualHost 127.0.0.1:80>
        ServerName cocorico.local
        ServerAlias cocorico.local

        #For multiple images uploads
        LimitRequestBody 240000000

        DocumentRoot /var/www/cocorico.local/Symfony/web
        <Directory /var/www/cocorico.local/Symfony/web>
            #For performance and security reasons we should not use htaccess in prod
            AllowOverride Indexes FileInfo AuthConfig
            Order Allow,Deny
            Allow from all
        </Directory>
    </VirtualHost>" > /etc/apache2/conf-available/cocorico.conf
else 
    echo "<VirtualHost 127.0.0.1:80>
      ServerName cocorico.local
      ServerAlias cocorico.local
      Redirect permanent / https://cocorico.local/
  </VirtualHost>

  <VirtualHost 127.0.0.1:443>
      ServerName cocorico.local
      ServerAlias cocorico.local

      SSLEngine on
      SSLCertificateFile "/etc/ssl/certs/cocorico.pem"
      SSLCertificateKeyFile "/etc/ssl/certs/private.key"

      DocumentRoot /var/www/cocorico.local/Symfony/web
      <Directory /var/www/cocorico.local/Symfony/web>
          #For performance reason we should not use htaccess
          AllowOverride Indexes FileInfo AuthConfig
          Order Allow,Deny
          Allow from all
      </Directory>
  </VirtualHost>" > /etc/apache2/conf-available/cocorico.conf
fi

echo "  -> Reactivation Apache2"
systemctl restart apache2

echo "=> Installation MongoDB"
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -









