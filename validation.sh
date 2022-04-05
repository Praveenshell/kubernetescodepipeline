#!/bin/bash
docker run -d nginx:latest sleep 30

tar -xvf docker-bench-security-master.zip
bash docker-bench-security/docker-bench-security.sh > /mnt/stdout.txt
chmod +x /mnt/stdout.txt
a=`cat /mnt/stdout.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
