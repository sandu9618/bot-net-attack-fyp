echo "pwd" | sudo tcpdump -i any -U -w - | nc 10.0.0.112 12345
