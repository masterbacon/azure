#!/bin/bash -x

firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
firewall-cmd --list-all

yum -y install tomcat
yum -y install tomcat-webapps
yum -y install tomcat-admin-webapps

systemctl restart tomcat
