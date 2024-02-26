source config/config.sh
##############################################################
# INSTALL NGINX INGRESS
##############################################################

kubectl -n ingress-nginx apply -f config/nginx-ingress/namespace.yaml

kubectl -n ingress-nginx create secret generic vcenter-certs \
                --from-file=$CONFIG_VCENTER_CERT_PATH

kubectl -n ingress-nginx apply -f config/nginx-ingress/deployment.yaml

