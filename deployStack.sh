#!/bin/bash

docker network create --driver overlay elastic
docker stack deploy -c docker-compose.yml elastic