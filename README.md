<p align="center">
<img src="./img/diagram.png" alt="Smiley face" height="300" width="500">
</p>

# Nebula Database
<a href="https://github.com/Squirrel-Network/nebula8">Nebula 8+</a> Database Structure

# Create the database with Docker
- Clone the repository

- cd /repository

### Docker Command
- 1 - ``` docker build . -t sn/mariadb:10.4.17 ```
- 2 - ``` docker run -d  -e MYSQL_ROOT_PASSWORD=banana -e MYSQL_DATABASE=nebula -v $(pwd)/init/:/docker-entrypoint-initdb.d/ -p 4406:3306  --name ms  sn/mariadb:10.4.17 ```


- Enjoy !
