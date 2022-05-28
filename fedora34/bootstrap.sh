#!/usr/bin/env bash

# Update System
dnf update -y

# Enable firewall
dnf install firewalld -y
systemctl enable firewalld --now

