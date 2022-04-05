#!/bin/bash
docker run -d nginx:latest sleep 30 > /dev/null 2>&1

unzip docker-bench-security.zip > /dev/null 3>&1
cd docker-bench-security
chmod +x docker-bench-security.sh
bash docker-bench-security.sh > /jobsdata/stdout.txt
chmod +x /jobsdata/stdout.txt
a=`cat /jobsdata/stdout.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
#cp -f /jobsdata/stdout.txt /jobsdata/stdout-`date`.txt
#rm -f /jobsdata/stdout.txt
