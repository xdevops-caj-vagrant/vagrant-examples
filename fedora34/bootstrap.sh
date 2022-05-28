#!/usr/bin/env bash

# Use dnf mirror repos
# Use Tsinghua tuna dnf repos
./use_fedora_repo_from_tuna.sh

# Update System
dnf update -y

# Enable firewall
dnf install firewalld -y
systemctl enable firewalld --now

