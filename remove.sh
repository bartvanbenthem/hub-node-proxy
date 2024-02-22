### CNCP HUB NODE CONFIGURATION
source ../00-ENV/env.sh
source config/config.sh

# Remove Azure pipeline agents
./config/azagent/remove.sh
# remove Ingress controller
./config/nginx-ingress/remove.sh

# remove k3s
./config/k3s/remove.sh