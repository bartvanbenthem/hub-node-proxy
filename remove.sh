### CNCP HUB NODE CONFIGURATION
source config/config.sh

# remove Ingress controller
./config/proxy/remove.sh
# remove Ingress controller
./config/nginx-ingress/remove.sh
# Remove Azure pipeline agents
./config/azagent/remove.sh

# remove k3s
./config/k3s/remove.sh