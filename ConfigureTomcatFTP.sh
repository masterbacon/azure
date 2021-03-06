#!/bin/bash -x

firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-port=20-22/tcp
firewall-cmd --permanent --add-port=10090-10100/tcp
firewall-cmd --permanent --add-service=ftp
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
firewall-cmd --list-all

yum -y install tomcat
yum -y install tomcat-webapps
yum -y install tomcat-admin-webapps
yum -y install vsftpd

systemctl enable vsftpd 
service vsftpd start
service vsftpd status

systemctl enable tomcat
systemctl restart tomcat
systemctl status tomcat

#Disable SElinux
setenforce 0
#Prevent SElinux running on reboot
sed -i -- 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

chmod a+w /var/lib/tomcat/webapps
