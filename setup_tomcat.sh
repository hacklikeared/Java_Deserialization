if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit
fi

port=$1

if [[ -z $port ]]; then
	port=8081
fi

### Setup tomcat
mkdir /usr/local/tomcat/webapps/ROOT/

### Add background picture
cp /Challenge/coffee.jpg /usr/local/tomcat/webapps/ROOT/

### Deploy jsp
cp /Challenge/index.jsp /usr/local/tomcat/webapps/ROOT/

cd /Challenge/
cp commons-codec-1.13.jar /usr/local/tomcat/lib/
javac dttl/test/call_me.java
jar cvf call_me.jar dttl/test/call_me.class
cp call_me.jar /usr/local/tomcat/lib/
cp call_me.jar /usr/local/tomcat/webapps/ROOT/

###Tomcat9 restart
/usr/local/tomcat/bin/catalina.sh stop

### Print status
echo -e "\n\nChallenges have been deployed at:"
echo -e "\thttp://localhost:$port/index.jsp"
