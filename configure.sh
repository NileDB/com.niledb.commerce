#!/bin/bash
sudo docker cp config.json core:/usr/verticles
sudo docker-compose restart core
