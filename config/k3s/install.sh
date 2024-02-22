curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--cluster-cidr=10.0.0.0/16 --disable=traefik" sh -
mkdir ~/.kube/
cp /etc/rancher/k3s/k3s.yaml ~/.kube/k3s.yaml

# kubectl auto complete and kubeconfig env var
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'complete -F __start_kubectl k' >>~/.bashrc
echo 'export KUBECONFIG=~/.kube/config:~/.kube/k3s.yaml' >>~/.bashrc

# Print info
printf '\n'
echo 'In order to add additional nodes to your cluster you need two piece of information'
echo ' - K3S_URL which is going to be your main node ip address'
echo ' - K3S_TOKEN which is stored in /var/lib/rancher/k3s/server/node-token'
echo 'curl -sfL https://get.k3s.io | K3S_URL=https://serverip:6443 K3S_TOKEN=mytoken sh -'
printf '\n'