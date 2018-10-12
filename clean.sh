echo "Stopping container.."
docker stop keosd
docker stop nodeos

echo "Removing container.."
docker rm keosd
docker rm nodeos

echo "Removing network.."
docker network rm eosdev

echo "Removing volumes"
docker volume prune

rm -r /tmp/eosio

rm userkeys
rm defaultmaster