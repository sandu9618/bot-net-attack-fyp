Yellow=$'\e[1;33m'
Reset=$'\e[0;m'

execute_ () {
  # TODO set root password of all IoT devices -> abcd
	sshpass -p abcd ssh -o "StrictHostKeyChecking no" -t -t root@"$1" -p 22  &
  sleep 1
  echo "$Yellow Execute tcpdump on $1 $Reset"
  tcpdump -i any -U -w -  'not port 12345' | nc 10.0.0.112 12345 #TODO IP should be changed according to gateway

}

while read -r line;
do
	IFS=" " read -ra ADDR <<<"$line"

	for i in "${ADDR[0]}";
	do
	IP="$i"
	done

  execute_ $IP &


done < credential.txt
exit
