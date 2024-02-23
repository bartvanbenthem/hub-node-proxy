### CNCP HUB NODE CONFIGURATION
source config/config.sh
# Install K3s and configure kube config
./config/k3s/install.sh

# Deploy Azure pipeline agents
./config/azagent/install.sh

# Install Ingress Controller
./config/nginx-ingress/install.sh

# Install proxy
./config/proxy/install.sh

kubectl get pods --all-namespaces --watch

