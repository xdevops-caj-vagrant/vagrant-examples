#!/usr/bin/env bash

# Use dnf mirror repos
# Backup repos
cp -p /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora.repo.bak
cp -p /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-updates.repo.bak

# Use Tsinghua tuna dnf repos
# https://mirrors.tuna.tsinghua.edu.cn/help/fedora/
curl -o /etc/yum.repos.d/fedora.repo \
     https://raw.githubusercontent.com/xdevops-caj-vagrant/vagrant-examples/main/fedora34/repos/tuna/fedora.repo
curl -o /etc/systemd/system/fedora-updates.repo \
     https://raw.githubusercontent.com/xdevops-caj-vagrant/vagrant-examples/main/fedora34/repos/tuna/fedora-updates.repo
curl -o /etc/systemd/system/fedora-modular.repo \
     https://raw.githubusercontent.com/xdevops-caj-vagrant/vagrant-examples/main/fedora34/repos/tuna/fedora-modular.repo
curl -o /etc/systemd/system/fedora-updates-modular.repo \
     https://raw.githubusercontent.com/xdevops-caj-vagrant/vagrant-examples/main/fedora34/repos/tuna/fedora-updates-modular.repo


dnf clean all
dnf makecache

# Update System
dnf update -y

# Enable firewall
dnf install firewalld -y
systemctl enable firewalld --now

