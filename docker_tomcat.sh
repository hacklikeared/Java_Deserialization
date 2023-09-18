port=8081
chal_name=Java_Deserialization

# replace port with an incremental port not used on main OS
# replace chal_name with actual chal_name
docker run -t -d -p $port:8080/tcp --name $chal_name tomcat
docker cp Challenge $chal_name:/
docker cp setup_tomcat.sh $chal_name:/

### run interactively to setup apt
docker exec -it $chal_name /bin/bash /setup_tomcat.sh $port

docker start $chal_name