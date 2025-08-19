#!/bin/bash

# resize disk from 20gb to 50gb
growpart /dev/nvme0n1 4 

lvextend -L +10G /dev/maper/RootVG-homeVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /home
xfs_growfs /var/tmp
xfs_growfs /var

# java installation
yum install java-21-openjdk -y

#Terraform installation
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

# nodejs installation
dnf module disable nodejs -y 
dnf module enable nodejs:20 -y
dnf install nodejs -y
yum install zip -y

# docker installation
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin ocker-compose-plugin -y
systemctl start docker
systemctl enale docker 
useradd -aG docker ec2-user

curl -fsSL -o get_helm.sh https://raw.githubsercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh