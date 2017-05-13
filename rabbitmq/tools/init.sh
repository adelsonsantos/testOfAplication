#!/usr/bin/env bash

rabbitmqctl add_vhost test
rabbitmqctl set_permissions -p test misere ".*" ".*" ".*"
