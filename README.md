# mgelastickibana
# Deploy the cluster use the following command
docker stack deploy -c docker-compose.yml mg

# To shutdown the cluster use this
docker service rm $(docker service ls -q)


