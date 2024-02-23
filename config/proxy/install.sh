
source config/config.sh

kubectl -n ingress-nginx create secret generic ca-certs --from-file=$CONFIG_CERT_PATH

cat <<EOF | kubectl apply -f -
#ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
  name: vcenter-proxy
  namespace: ingress-nginx
spec:
  ingressClassName: nginx
  rules:
  - host: $CONFIG_VCENTER_HUB_ALIAS
    http:
      paths:
      - backend:
          service:
            name: vcenter-proxy
            port:
              number: 443
        path: /
        pathType: ImplementationSpecific
---
apiVersion: v1
kind: Endpoints
metadata:
  name: vcenter-proxy # Must be equal to Service name for automatic mapping
  namespace: ingress-nginx
subsets:
- addresses:
  - ip: $CONFIG_VCENTER_IP # IP address of your external service that you would like to proxy requests to
  ports:
  - port: 443
---
apiVersion: v1
kind: Service
metadata:
  name: vcenter-proxy
  namespace: ingress-nginx
spec:
  ports:
    - port: 443
      protocol: TCP
      targetPort: 443
      name: https
EOF