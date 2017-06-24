# mgelastickibana
Deploy the cluster use the following command
- sysctl -w vm.max_map_count=262144 (on each of the node)
- docker swarm init --advertise-addr <ipaddress> (on the master node)
- run the join token on each of the worker node
- docker stack deploy -c docker-compose.yml mg

# To shutdown the cluster use this
docker service rm $(docker service ls -q)



