#!/bin/bash
## Script que lanza todos los comandos de terraform y almacena las IPs públicas para inyectarlas en el Hosts de Ansible
terraform init
terraform validate
terraform plan -var-file="./vars.tfvars"
terraform apply -var-file="./vars.tfvars"
echo '---------------------------------------------'
echo 'Master public IP:'
terraform output public_ip_address_master
MASTERIP=$(terraform output public_ip_address_master | sed 's/\"//g')
echo 'master.azure'
echo '---------------------------------------------'
echo 'Workers public IPs:'
terraform output public_ip_address_worker
WORKERIP=$(terraform output public_ip_address_worker | sed 's/\"//g')
echo 'worker1.azure'
terraform output public_ip_address_worker2
WORKERIP2=$(terraform output public_ip_address_worker2 | sed 's/\"//g')
echo 'worker2.azure'
echo '---------------------------------------------'
echo 'NFS public IP:'
terraform output public_ip_address_nfs
NFSIP=$(terraform output public_ip_address_nfs | sed 's/\"//g')
echo 'nfs.azure'
echo '---------------------------------------------'
# Se almacenan las variables en el hosts de Ansible
sed -i '' "6s/.*/$MASTERIP/" ../ansible/hosts
sed -i '' "9s/.*/$WORKERIP/" ../ansible/hosts
sed -i '' "10s/.*/$WORKERIP2/" ../ansible/hosts
sed -i '' "13s/.*/$NFSIP/" ../ansible/hosts
