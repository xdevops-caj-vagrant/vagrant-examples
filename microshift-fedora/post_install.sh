# Install OpenShift and Kubernetes Clients
curl -O https://mirror.openshift.com/pub/openshift-v4/$(uname -m)/clients/ocp/stable/openshift-client-linux.tar.gz
sudo tar -xf openshift-client-linux.tar.gz -C /usr/local/bin oc kubectl

# Copy Kubeconfig
mkdir -p ~/.kube
sudo podman cp microshift:/var/lib/microshift/resources/kubeadmin/kubeconfig ~/.kube/config
sudo chown `whoami`: ~/.kube/config

# OC bash completion
sudo dnf -y install bash-completion
oc completion bash > oc_bash_completion
sudo cp oc_bash_completion /etc/bash_completion.d/