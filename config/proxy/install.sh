
source config/config.sh

kubectl -n ingress-nginx create secret generic ca-certs --from-file=$CONFIG_CERT_PATH