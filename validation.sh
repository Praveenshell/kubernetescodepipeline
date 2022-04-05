#!/bin/bash
docker run -d nginx:latest sleep 30 > /dev/null 2>&1

unzip docker-bench-security-master.zip
cd docker-bench-security-master
bash docker-bench-security.sh | tee stdout.txt
chmod +x stdout.txt
a=`cat stdout.txt | grep -i Score: | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "image_success"
else
        echo "image_failure"
fi
cp -f stdout.txt stdout-`date`.txt
rm -f stdout.txt
