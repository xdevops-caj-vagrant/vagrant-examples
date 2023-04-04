# Install Minikube on MacOS

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

# assume alreay installed virtualbox on MacOS
minikube start --driver=virtualbox
```

Verify:

```bash
# check minikube version
minikube version

# check minikube status
minikube status

# check cluster info
kubectl cluster-info

# check version
kubectl version

# check nodes
kubectl get nodes

# check pods
kubectl get pods -A
```

You can use `kubectl` in your MacOS, or use `minikube kubectl` instead.


```

## Install / Update kubectl on MocOs(optional)

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

## Open Minikube dashboard

Open the dashboard in a separate terminal:

```bash
minikube dashboard
```


## Deploy and access apps

Run the tunnel in a separate terminal:
```bash
minikube tunnel
```

Deploy app and expose service:
```bash
kubectl create deployment hello-minikube1 --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube1 --type=LoadBalancer --port=8080
```

Check the external IP:
```bash
kubectl get svc
```

Access the app:
```bash
http://REPLACE_WITH_EXTERNAL_IP:8080
```

References:
- https://minikube.sigs.k8s.io/docs/handbook/accessing/

## Enable Istio addon

```bash
minikube addons list
minikube addons enable istio
```

## References

- https://minikube.sigs.k8s.io/docs/start/
- https://kubernetes.io/de/docs/tasks/tools/install-minikube/