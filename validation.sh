#!/bin/bash
docker run -d nginx:latest sleep 30

cd /data/docker-bench-security/

bash docker-bench-security.sh > /mnt/out.txt
chmod +x /mnt/out.txt
a=`cat /tmp/out.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
