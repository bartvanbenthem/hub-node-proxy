# set variables
NAMESPACE=$CONFIG_NAMESPACE
ADOURL=$CONFIG_AZURL
ADOPOOL=$CONFIG_AZPOOL

kubectl -n $NAMESPACE delete -f 'config/azagent/deployment.yaml'
kubectl -n $NAMESPACE delete secret ca-certs
# kubectl -n $NAMESPACE delete secret azagent-proxy
kubectl -n $NAMESPACE delete secret azdevops
kubectl -n $NAMESPACE delete secret azagent-token
kubectl delete namespace $NAMESPACE