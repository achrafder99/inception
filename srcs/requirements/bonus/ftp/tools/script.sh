#!/bin/sh

useradd -m $USER_FTP && echo "$USER_FTP:$PASS_FTP" | chpasswd

mkdir -p /home/$USER_FTP

chmod 777 /home/$USER_FTP

chown $USER_FTP:$USER_FTP /home/$USER_FTP

touch /etc/vsftpd.userlist && echo $USER_FTP > /etc/vsftpd.userlist

sleep 5

exec vsftpd /etc/vsftpd.conf