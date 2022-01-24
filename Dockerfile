FROM mariadb:10.4.17

RUN apt-get update; apt-get install -y curl

# docker build . -t sn/mariadb:10.4.17
