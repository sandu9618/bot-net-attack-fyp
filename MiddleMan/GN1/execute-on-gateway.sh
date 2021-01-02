Yellow=$'\e[1;33m'
Reset=$'\e[0;m'

sshpass -p ijkl ssh -o "StrictHostKeyChecking no" -t -t root@10.0.0.112 -p 22  & #TODO IP should be changed according to gateway
sleep 1
echo "$Yellow Execute on gateway 10.0.0.112 $Reset"
echo ijkl | sudo nc -l -p 12345 > /root/results/gateway-n1.pcap
