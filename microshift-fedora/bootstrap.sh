# Update System
dnf update -y

# Install and enable firewall
dnf install firewalld -y
systemctl enable firewalld --now

# Install Podman
dnf install -y podman

# Enable and start MicroShift
curl -o /etc/systemd/system/microshift.service \
     https://raw.githubusercontent.com/redhat-et/microshift/main/packaging/systemd/microshift-containerized.service

firewall-cmd --zone=trusted --add-source=10.42.0.0/16 --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=5353/udp --permanent
firewall-cmd --reload

systemctl enable microshift --now

# Install OpenShift and Kubernetes Clients
curl -O https://mirror.openshift.com/pub/openshift-v4/$(uname -m)/clients/ocp/stable/openshift-client-linux.tar.gz
sudo tar -xf openshift-client-linux.tar.gz -C /usr/local/bin oc kubectl

# Copy Kubeconfig
mkdir ~/.kube
podman cp microshift:/var/lib/microshift/resources/kubeadmin/kubeconfig ~/.kube/config
chown `whoami`: ~/.kube/config
