#!/bin/bash
docker run -d nginx:latest sleep 30 > /dev/null 2>&1

unzip docker-bench-security-master.zip
bash docker-bench-security-master/docker-bench-security.sh | tee /mnt/stdout.txt
chmod +x /mnt/stdout.txt
a=`cat /mnt/stdout.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
cp -f /mnt/stdout.txt /mnt/stdout
rm -f /mnt/stdout.txt
