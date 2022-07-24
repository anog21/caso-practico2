#!/bin/bash
## Este script lanza en una primera instancia el script para lanzar el Terraform y, posteriormente, lanzar el Ansible.
cd ./terraform
bash ./launch-terraform.sh

cd ../ansible
bash ./deploy.sh

