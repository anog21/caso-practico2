#!/bin/bash

ansible-playbook 0-requirements-installation.yml -i hosts
ansible-playbook 1-nfs-config.yml -i hosts
ansible-playbook 2-master-config.yml -i hosts
ansible-playbook 3-worker-config.yml -i hosts
