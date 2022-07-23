# Caso Practico 2
En este repositorio se puede encontrar todo el código relativo a la Automatización de despliegues en entornos Cloud.

El código se divide en dos partes: Despliegue automatizado de infraestructura con Terraform y Despliegue del Cluster de K8s y aplicación con Ansible


## Terraform
---
En la carpeta Terraform se pueden encontrar los diferentes módulos donde se describe la infraestructura. Todo el despliegue se realiza con el módulo **azurerm** de Hashicorp.

Los archivos de Terraform son los siguientes:
- **credentials.tf**: en este archivo se encuentra descrita la subscripción de Azure sin incluír contraseñas, ya que el módulo de terraform accede directamente con el az cli instalado en la máquina local.
- **variables.tf**: Se encuentran todas las variables declaradas.
- **correcion-vars.tf**: Variables para la correción del caso práctico.
- **vars.tfvars**: en este archivo se describen los valores de las variables.
- **main.tf**: el main donde se describe el resource group y el storage account.
- **network.tf**: se describen los elementos de red a desplegar.
- **nsg.tf**: se describen las reglas del security group.
- **vm.tf**: contiene las variables para desplegar las máquinas virtuales.
- **output.tf**: Archivo donde se declaran las variables de salida que se utilizarán para el despliegue completo.



Para el despliegue automático de la infraestructura se ha descrito un script en bash llamado **launch-terraform** en el que se lanzan los diferentes comandos a realizar. Por último se recogen las IPs públicas de las máquinas virtuales y se sustituyen las líneas en el archivo hosts de la carpeta Ansible.
También se ha creado un archivo llamado **destroy-terraform.sh** con los comandos necesarios para destruir la infraestructura. Para la ejecución de los scripts es necesario siempre validar con un 'yes' los comandos de Terraform. 

## Ansible
---

En la carpeta Ansible se encuentran descritos todos los Playbook, Roles y variables para el despliegue del cluster de Kubernetes y la Aplicación.
Los playbooks descritos son los siguientes:
- **0-requirements-installation.yml**: instalación de requerimientos previos en las máquinas master y workers.
- **1-nfs-config.yml**: configuración del servidor NFS.
- **2-masterconfig**: configuración del master de K8s.
- **3-worker-config.yml**: configuración de los workers de K8s.
- **4-application-config.yml**: despliegue de los PV, PVC y Deployment de la aplicación, en este caso Prometheus.

En la carpeta roles se describen las diferentes tasks para cada uno de los playbooks. En el nombre de cada task se describe su función.

En el archivo **Hosts** se encuentra en inventario de las máquinas virtuales donde se lanzan los diferentes playbooks. 

El archivo **token_worker** incluye el comando para juntar los workers al Master generado de forma automático.

Por último, se encuentra un script para la ejecución de los playbooks de forma secuencial titulado deploy.sh.

