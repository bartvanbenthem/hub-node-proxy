# on master node
/usr/local/bin/k3s-uninstall.sh

# rancher image cleanup
k3s crictl rmi --prune