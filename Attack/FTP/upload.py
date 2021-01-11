import ftplib

FTP_HOST = "192.168.8.103"
FTP_USER = "fyp"
FTP_PASS = "1234"

# connect to the FTP server
ftp = ftplib.FTP(FTP_HOST, FTP_USER, FTP_PASS)
# force UTF-8 encoding
ftp.encoding = "utf-8"

# local file name you want to upload
filename = "Attack\IRC\client.py"
with open(filename, "rb") as file:
    # use FTP's STOR command to upload the file
    ftp.storbinary(f"STOR {filename}", file)

# list current files & directories
ftp.dir()
