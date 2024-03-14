#! /bin/bash

if [ ! -e $FTP_CERT_FILE -o ! -e /etc/ssl/private/vsftpd-selfsigned.key ]; then
  echo "Certification files not exist. Make certification files by certbot"
  openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=$DOMAIN_NAME" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key -out $FTP_CERT_FILE	
fi

if [ ! -e /var/log ]; then
	mkdir -p /var/log
fi

if [ ! -e /var/www/html/ftp_upload ]; then
  mkdir -p /var/www/html/ftp_upload
fi

if [ ! -e /etc/ftp_init_check ]; then
  adduser $FTP_USER_NAME --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password

  echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | /usr/sbin/chpasswd

  echo "$FTP_USER_NAME" | tee -a /etc/vsftpd.userlist

  chown -R $FTP_USER_NAME:$FTP_USER_NAME /var/www/html/ftp_upload

  sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf

  sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

  sed -i -r "s/rsa_cert_file=\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/rsa_cert_file=\/etc\/ssl\/certs\/vsftpd-selfsigned.crt/1"   /etc/vsftpd.conf

  sed -i -r "s/rsa_private_key_file=\/etc\/ssl\/private\/ssl-cert-snakeoil.key/rsa_private_key_file=\/etc\/ssl\/private\/vsftpd-selfsigned.key/1"   /etc/vsftpd.conf

  sed -i -r "s/ssl_enable=NO/ssl_enable=YES/1"   /etc/vsftpd.conf

  mkdir -p /var/run/vsftpd/empty

  echo "
  allow_writeable_chroot=YES
  local_root=/var/www/html
  pasv_enable=YES
  pasv_min_port=60000
  pasv_max_port=60005
  pasv_address=127.0.0.1
  userlist_enable=YES
  userlist_deny=NO
  userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

  touch /etc/ftp_init_check
fi

/usr/sbin/vsftpd