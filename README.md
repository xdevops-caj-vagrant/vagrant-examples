[TOC]

# Vagrant Examples

## Usage

```bash
# Clone the project
git clone https://github.com/xdevops-caj-vagrant/vagrant-examples.git
cd vagrant-examples/centos8

# modify Vagrantfile to customize the VM

# create a `data` folder to data sync between host and guest VM
mkdir -p data

# boostrap and start the VM
vagrant up

# connect to the VM
vagrant ssh

```
