#!/bin/bash -x

# Set up firewall for certs/HTTPS demo that follows
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
firewall-cmd --list-all

yum -y update
tee /etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum -y install docker-engine

systemctl enable docker
service docker start
systemctl status docker
