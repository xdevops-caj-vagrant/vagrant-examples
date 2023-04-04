# Install Minikube with Vagrant

If you want to find install Minikube on MacOS, please refer to [install_minikube_on_mac](install_minikube_on_mac.md).

# Start Minikube in Vagrant
```bash
# create data directory
mkdir -p data

# start vagrant vm
vagrant up

# connect to vagrant vm
vagrant ssh
```

Restart minikube with aliyun image repo:
```bash
sudo usermod -aG docker $USER && newgrp docker

# Failed to install the latest version of minikube via aliyun image miroor
# minikube start --image-mirror-country=cn
# Successfully installed minikube for v1.26.0 and below
minikube start --image-mirror-country=cn --kubernetes-version=v1.26.0

# check minikube status
minikube status
```

# Access Minikube cluster

Check cluster info:
```bash
kubectl cluster-info
```

Check nodes:
```bash
kubectl get nodes
```


## References

- https://minikube.sigs.k8s.io/docs/start/
- [Getting Started with Minikube in Vagrant](https://www.youtube.com/watch?v=r1NY08qKF_c)
- https://docs.docker.com/engine/install/ubuntu/