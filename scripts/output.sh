#!/bin/sh
ip=$(cd terraform && terraform output -raw ec2_ip)
echo "${ip} ansible_ssh_private_key_file=/home/ubuntu/.ssh/dev.pem ansible_user=ubuntu" > /home/ubuntu/infra_test/ansible/inventory
