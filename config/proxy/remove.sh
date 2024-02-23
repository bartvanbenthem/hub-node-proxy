kubectl -n ingress-nginx delete svc vcenter-proxy
kubectl -n ingress-nginx delete endpoints vcenter-proxy
kubectl -n ingress-nginx delete ingresses vcenter-proxy
kubectl -n ingress-nginx delete secret ca-certs