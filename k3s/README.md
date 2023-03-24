# Install k3s with vagrant

## Install guide
Change install script as below

```bash
curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -
```

Cluster Access:

```bash
mkdir -p ~/.kube
sudo k3s kubectl config view --raw | tee ~/.kube/config
chmod 600 ~/.kube/config
```

Add this command into the end of  `~/.bashrc` 。
```bash
export KUBECONFIG=~/.kube/config
```

Make it effective:
```bash
source ~/.bashrc
```

## Verify cluster

Check nodes:

```bash
kubectl get nodes
```

Check pods:
```bash
kubectl get pods -A
```

## Deploy a sample application

```bash
kubectl create deployment nginx --image=nginx --port=80 --replicas=3
kubectl create service clusterip nginx --tcp=80:80
```

Ingress `nginx-ingress.yaml`:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx
            port:
              number: 80
```

Apply ingress:
```bash
kubectl apply -f nginx-ingress.yaml
```

On host machine, open k3s guest machine address in browser. 
Example: `192.168.56.50`

## References
- https://docs.rancher.cn/docs/k3s/quick-start/_index
- https://www.baeldung.com/ops/k3s-getting-started