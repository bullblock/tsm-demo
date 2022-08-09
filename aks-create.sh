#/bin/bash
az aks create --resource-group steven-group --name aks-demo --node-count 3 --node-vm-size Standard_D8_v4 --ssh-key-value ~/.ssh/id_rsa.pub
