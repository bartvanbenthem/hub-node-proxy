source ../00-ENV/env.sh

export CONFIG_VCENTER=''
export CONFIG_NAMESPACE='azagent'
export CONFIG_AZPOOL='ocp01'
export CONFIG_AZURL='https://dev.azure.com/DevOps-SST'
export CONFIG_AZPTOKEN=$PAT # replace this with actual token
export CONFIG_CERT_PATH='../00-ENV/CERTIFICATE.crt'