#!/bin/bash

read -p "Elastiv Version:" ES_VERSION
read -p "Cluster Name:" ES_CLUSTER
read -p "Elastic Port#:" ES_PORT
read -p "Kibana Port#:" KIBANA_PORT
read -p "Cerebro Port#:" CEREBRO_PORT
read -p "Visualizer Port#:" VIZ_PORT

echo "Request Version: ${ES_VERSION}"
echo "Requested Cluster Name: ${ES_CLUSTER}"
echo "Requested Elastic Port: ${ES_PORT}"
echo "Requested Kibana Port: ${KIBANA_PORT}"
echo "Requested Cerebro Port: ${CEREBRO_PORT}"
echo "Requested Visualizer Port: ${VIZ_PORT}"

echo -n "Do you agree with this? [yes or no]: "
read yno
case $yno in

        [yY] | [yY][Ee][Ss] )
                docker network create --driver overlay elastic
                VIZ_PORT="${VIZ_PORT}" CEREBRO_PORT="${CEREBRO_PORT}" ES_PORT="${ES_PORT}" KIBANA_PORT="${KIBANA_PORT}" ES_VERSION="${ES_VERSION}" ES_CLUSTER="${ES_CLUSTER}" docker stack deploy -c docker-compose.yml elastic
                ;;

        [nN] | [n|N][O|o] )
                echo "Not agreed, you cannot proceed the installation";
                exit 1
                ;;
        *) echo "Invalid input"
            ;;
esac
