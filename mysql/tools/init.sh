#!/usr/bin/env bash

mysql -u root -pmilofre90 -e "CREATE SCHEMA IF NOT EXISTS tetra_track_test";
mysql -u root -pmilofre90 -e "CREATE USER 'migration_user'@'%' IDENTIFIED BY 'milofre90_migration';"
mysql -u root -pmilofre90 -e "GRANT ALL PRIVILEGES ON *.* TO 'migration_user'@'%';"
mysql -u root -pmilofre90 -e "GRANT ALL PRIVILEGES ON *.* TO 'tetra_track_user'@'%';"
mysql -u root -pmilofre90 tetra_track_test < /opt/tools/dump.sql