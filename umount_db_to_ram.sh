#!/usr/bin/env bash
BASEDIR=$(dirname "$0")
umount $BASEDIR/mysql/data
umount $BASEDIR/mongo/data
umount /mnt/ramdisk