echo "pwd" | sudo tcpdump -i any -U -w - | nc 10.0.42.2 12345
