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

service vsftpd start
service vsftpd status

systemctl restart tomcat
systemctl status tomcat

setenforce 0
