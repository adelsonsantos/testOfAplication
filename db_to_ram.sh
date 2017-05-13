#!/usr/bin/env bash
BASEDIR=$(dirname "$0")
mkdir -p /mnt/ramdisk
mount -t tmpfs -o size=5g tmpfs /mnt/ramdisk
mkdir -p /mnt/ramdisk/mongo/data
mkdir -p /mnt/ramdisk/mysql/data
cp $BASEDIR/mongo/data/.gitignore /mnt/ramdisk/mongo/data/
cp $BASEDIR/mysql/data/.gitignore /mnt/ramdisk/mysql/data/
cp $BASEDIR/project/protected/tests/_data/dump.sql $BASEDIR/mysql/tools/dump.sql
mount --bind /mnt/ramdisk/mongo/data $BASEDIR/mongo/data
mount --bind /mnt/ramdisk/mysql/data $BASEDIR/mysql/data
docker-compose up &
sleep 30s
read -rsp $'Press enter to continue to migrate up\n'
docker exec dockeryiintopus_mysql_1 bash opt/tools/init.sh