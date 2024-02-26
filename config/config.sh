source ../00-ENV/env.sh

export CONFIG_VCENTER_HUB_ALIAS='hostname.cndev.nl'
export CONFIG_VCENTER_FQDN='test'
export CONFIG_VCENTER_IP='8.8.8.8'
export CONFIG_NAMESPACE='azagent'
export CONFIG_AZPOOL='ocp01'
export CONFIG_AZURL='https://dev.azure.com/DevOps-SST'
export CONFIG_AZPTOKEN=$PAT
export CONFIG_CERT_PATH='../00-ENV/CERTIFICATE.crt'
export CONFIG_VCENTER_CERT_PATH='../00-ENV/vcenter-ca.pem'
export CONFIG_INGRESS_CRT_PATH='../00-ENV/ingress.crt'
export CONFIG_INGRESS_KEY_PATH='../00-ENV/ingress.key'