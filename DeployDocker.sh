#!/bin/bash -x

yum -y update
yum -y install docker-engine
tee /etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum -y install docker-engine
service docker start
service docker status

ls -l /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.0/
sudo ls -l /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.0/
