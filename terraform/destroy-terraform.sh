#!/bin/bash

terraform init
terraform destroy -var-file="./vars.tfvars"