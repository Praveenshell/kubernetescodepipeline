docker run -d nginx:latest sleep 30 > /dev/null 2>&1

sudo rm -rf docker-bench-security

unzip docker-bench-security.zip > /dev/null 3>&1
cd docker-bench-security

sudo chmod +x docker-bench-security.sh
sudo bash docker-bench-security.sh > /jobsdata/stdout.txt
chmod +x /jobsdata/stdout.txt
a=`cat /jobsdata/stdout.txt | grep -i Score:`
// | awk {'print $3'}`
echo "$a"
if [ $a -gt 5 ];
then
        echo "success"
else
        echo "failure"
fi
#cp -f /jobsdata/stdout.txt /jobsdata/stdout-`date`.txt
#rm -f /jobsdata/stdout.txt
