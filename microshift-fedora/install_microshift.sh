#!/usr/bin/env bash

# Update System
dnf update -y

# Install and enable firewall
dnf install firewalld -y
systemctl enable firewalld --now

# Install CRI-O
dnf module enable -y cri-o:1.21
dnf install -y cri-o cri-tools
systemctl enable crio --now

# Install Podman
dnf install -y podman

# Enable and start MicroShift
# curl -o /etc/systemd/system/microshift.service \
#      https://raw.githubusercontent.com/redhat-et/microshift/main/packaging/systemd/microshift-containerized.service
cp -p /vagrant/microshift/microshift-containerized.service /etc/systemd/system/microshift.service

firewall-cmd --zone=trusted --add-source=10.42.0.0/16 --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=5353/udp --permanent
firewall-cmd --reload

systemctl enable microshift --now


