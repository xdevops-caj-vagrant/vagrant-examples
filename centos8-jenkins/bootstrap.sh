#!/usr/bin/env bash

# Fix Appstream issue
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Update System
dnf update -y

# Install Git
dnf install -y git

# Install OpenJDK
sudo dnf install java-11-openjdk

# Install Jenkins
# https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo dnf install jenkins
sudo systemctl daemon-reload
