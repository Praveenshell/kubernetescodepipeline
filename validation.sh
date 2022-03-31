#!/bin/bash
docker run -d nginx:latest sleep 30

cd /data/docker-bench-security/

bash docker-bench-security.sh > /tmp/out.txt

a=`cat /tmp/out.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 10 ];
then
        echo "success"
else
        echo "failure"
fi
sleep 31
docker rm $(docker ps -a)
