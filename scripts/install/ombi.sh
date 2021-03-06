docker stop jim-ombi
docker rm jim-ombi
#sudo rm -rf ~/config/ombi
docker run -d -i \
	--restart=always \
	--name requests \
	-v $DOCKER_CONFIG/ombi:/config \
	-e EAP=0 \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-l traefik.host="requests" \
rxwatcher/docker-ombi

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Ombi','https://requests.wildhair.nl','false','true','true','false','fa-diamond','images/couchpotato.png','false');"
docker restart $USER-organizr
