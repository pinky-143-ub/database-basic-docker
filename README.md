# database-basic-docker
Clone this repo and then
create docker image
docker build -t dbimage:v1 .
create the container
docker run -d --name db-cont -p 1111:3306 db-image:v1
docker ps
docker exec -it db-cont bash:
How to login mysql

mysql -u root -p
admin123

mysql> show databases;
list of databases

mysql>use tfi_heros_db;

mysql> show tables;

mysql>select * from heros;
