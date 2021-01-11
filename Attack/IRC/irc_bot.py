from Attack.IRC.irc_class import IRC

server = "10.50.60.181"  # Provide a valid server IP/Hostname
port = 7000
channel = "#python"
botnick = "techbeamers"
botnickpass = "guido"
botpass = "<%= @guido_password %>"
irc = IRC()
irc.connect(server, port, channel, botnick, botpass, botnickpass)

while True:
    print("Waiting for response...")
    text = irc.get_response()
    print(text)

    if "PRIVMSG" in text and channel in text and "hello" in text:
        irc.send(channel, "Hello!")