# Este es el archivo donde se declaran todas las variables

# Información de la red
virtual_network_name = "redkubernetes"
virtual_subnet_name = "subredkubernetes"
# Nombre de las máquinas
virtual_machine_name1 = "master"
virtual_machine_name2 = "worker1"
virtual_machine_name3 = "nfs"
virtual_machine_name4 = "worker2"
# Tamaño de las VMs
master_vm_size="Standard_B2s"
worker_vm_size="Standard_DS1_v2"
nfs_vm_size="Standard_DS1_v2"

# Nombre de las interfaces de red
name_nic1="MasterNIC"
name_nic2="WorkerNIC"
name_nic3="NFSNIC"
name_nic4="Worker2NIC"