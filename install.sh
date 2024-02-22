### CNCP HUB NODE CONFIGURATION
source ../00-ENV/env.sh
source config/config.sh
# Install K3s and configure kube config
#./config/k3s/install.sh

# Deploy Azure pipeline agents
./config/azagent/install.sh

# Install Ingress Controller
./config/nginx-ingress/install.sh

