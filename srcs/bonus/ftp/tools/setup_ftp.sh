#/bin/sh
useradd -m $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
chmod 755 /home/$FTP_USER
chmod u+w /home/$FTP_USER
sed -i 's/^#\?anonymous_enable=.*/anonymous_enable=NO/' /etc/vsftpd.conf
sed -i 's/^#\?local_enable=.*/local_enable=YES/' /etc/vsftpd.conf
sed -i 's/^#\?write_enable=.*/write_enable=YES/' /etc/vsftpd.conf
sed -i "s/^#\?nopriv_user=.*/nopriv_user=$FTP_USER/" /etc/vsftpd.conf
sed -i 's/^#\?xferlog_enable=.*/xferlog_enable=YES/' /etc/vsftpd.conf


echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=21100" >> /etc/vsftpd.conf
echo "pasv_max_port=21110" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
chmod 555 /var/run/vsftpd/empty