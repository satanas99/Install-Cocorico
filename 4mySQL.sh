#!/bin/bash
#demander nom db , user et mdp
mysql -e "CREATE DATABASE IF NOT EXISTS Cocorico DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, REFERENCES ON Cocorico.* TO login4152@localhost IDENTIFIED BY 'WnHZcAuGAeLgOmG'"