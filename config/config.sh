source ../00-ENV/env.sh

export CONFIG_VCENTER_FQDN='test' # FQDN vcenter server
export CONFIG_VCENTER_IP='8.8.8.8' # IP vcenter server
export CONFIG_NAMESPACE='azagent' # Namespace pipeline agents
export CONFIG_AZPOOL='ocp01' # Azure DevOps Agent Pool name
export CONFIG_AZURL='https://dev.azure.com/DevOps-SST' # Azure DevOps URL
export CONFIG_AZPTOKEN=$PAT # Azure DevOps Personal Access Token
export CONFIG_CERT_PATH='../00-ENV/CERTIFICATE.crt' # CA Certificate bundle for pipeline agents .crt
export CONFIG_VCENTER_CERT_PATH='../00-ENV/vcenter-ca.pem' # curl https://<vcenter>/certs/download.zip --insecure -o certs.zip
export CONFIG_INGRESS_CRT_PATH='../00-ENV/ingress.crt' # self signed certificate ingress resource
export CONFIG_INGRESS_KEY_PATH='../00-ENV/ingress.key' # self signed certificate ingress resource
export CONFIG_VCENTER_HUB_ALIAS='<vcenter.cnsdev.nl>' # fqdn ingress resource for vcenter server endpoint