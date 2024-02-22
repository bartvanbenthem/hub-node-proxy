source config/config.sh
##############################################################
# INSTALL NGINX INGRESS
##############################################################
kubectl -n ingress-nginx apply -f config/nginx-ingress/deployment.yaml

