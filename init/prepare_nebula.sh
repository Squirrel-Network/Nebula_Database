curl https://raw.githubusercontent.com/Squirrel-Network/Nebula_Database/main/nebula.sql | mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE

# docker run -ti -d  -e MYSQL_ROOT_PASSWORD=pippo -e MYSQL_DATABASE=nebula -v $(pwd)/init/:/docker-entrypoint-initdb.d/  --name ms  sn/mariadb:10.4.17

# docker logs ms -f
# docker rm ms --force 
