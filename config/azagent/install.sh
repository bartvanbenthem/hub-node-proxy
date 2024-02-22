source config/config.sh
# set variables
NAMESPACE=$CONFIG_NAMESPACE
ADOURL=$CONFIG_AZURL
ADOPOOL=$CONFIG_AZPOOL

# create namespace
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

# prestage the PAT (token) Secret for succesfull Azure AUTH
kubectl -n $NAMESPACE create secret generic azagent-token --dry-run=client -o yaml \
                  --from-literal=AZP_TOKEN=$CONFIG_AZPTOKEN | kubectl apply -f -

# azure devops config
kubectl -n $NAMESPACE create secret generic azdevops --dry-run=client -o yaml \
    --from-literal=AZP_URL=$ADOURL \
    --from-literal=AZP_POOL=$ADOPOOL \
    --from-literal=AZP_AGENT_NAME="" \
    --from-literal=AGENT_MTU_VALUE="" | kubectl apply -f -

# update secret containing proxy settings
#kubectl -n $NAMESPACE create secret generic azagent-proxy \
#                  --from-literal=PROXY_USER=$KPN_PROXY_USER \
#                  --from-literal=PROXY_PW=$KPN_PROXY_PW \
#                  --from-literal=PROXY_URL=$KPN_PROXY_URL \
#                  --from-literal=HTTP_PROXY=$KPN_HTTP_PROXY \
#                  --from-literal=HTTPS_PROXY=$KPN_HTTPS_PROXY \
#                  --from-literal=http_proxy=$KPN_HTTP_PROXY \
#                  --from-literal=https_proxy=$KPN_HTTPS_PROXY \
#                  --from-literal=NO_PROXY=$NOPROXY \
#                  --from-literal=FTP_PROXY=''
 
# inject CA Certificates to CDTarget agents
# in /usr/local/share/ca-certificates/CERTIFICATE.crt
# updated trust store: /etc/ssl/certs/ca-certificates.crt
kubectl -n $NAMESPACE create secret generic ca-certs \
                --from-file=$CONFIG_CERT_PATH

# apply all manifests
kubectl -n $NAMESPACE apply -f 'config/azagent/deployment.yaml'