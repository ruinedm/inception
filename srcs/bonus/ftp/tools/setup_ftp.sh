#/bin/sh
useradd -m ftpsecure && echo "ftpsecure:123" | chpasswd


sed -i 's/^#\?anonymous_enable=.*/anonymous_enable=NO/' /etc/vsftpd.conf
sed -i 's/^#\?local_enable=.*/local_enable=YES/' /etc/vsftpd.conf
sed -i 's/^#\?write_enable=.*/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/^#\?nopriv_user=.*/nopriv_user=ftpsecure/' /etc/vsftpd.conf
sed -i 's/^#\?xferlog_enable=.*/xferlog_enable=YES/' /etc/vsftpd.conf


echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=21100" >> /etc/vsftpd.conf
echo "pasv_max_port=21110" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
chmod 555 /var/run/vsftpd/empty