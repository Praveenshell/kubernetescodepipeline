#!/bin/bash
docker run -d test:latest

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
