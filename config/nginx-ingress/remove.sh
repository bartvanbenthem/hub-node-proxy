kubectl -n ingress-nginx delete -f config/nginx-ingress/deployment.yaml
kubectl -n ingress-nginx delete secret vcenter-certs
kubectl -n ingress-nginx delete -f config/nginx-ingress/namespace.yaml