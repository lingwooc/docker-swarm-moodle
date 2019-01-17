docker-compose build
docker-compose push
docker stack deploy --resolve-image always --with-registry-auth -c docker-swarm.yml dockermoodle