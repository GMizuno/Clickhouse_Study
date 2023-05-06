# Quick Start

## requirements 
docker engine |  https://docs.docker.com/engine/install/
docker-compose | https://docs.docker.com/compose/

## Start clickhouse with docker containers
Go to folder 03-quickstar/docker and excute commands below:

    docker-compose up -d # START containers with daemon
    docker-compose down # STOP containers

## Connect with CLI the clickhouse server 
docker exec -it clickhouse-server clickhouse-client 

## Tools to access clickhouse 
https://dbeaver.io/download/ 

https://www.jetbrains.com/datagrip/
