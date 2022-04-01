#!/bin/bash
docker run -d nginx:latest sleep 30

cd /data/docker-bench-security/

bash docker-bench-security.sh > /tmp/out.txt

a=`cat /tmp/out.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 10 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
sleep 10
docker stop $(docker ps -a)
sleep 1
docker rm $(docker ps -a)
