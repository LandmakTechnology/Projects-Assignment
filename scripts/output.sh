#!/bin/sh
ip=$(cd terraform && terraform output -raw ec2_ip)
echo "${ip} ansible_ssh_private_key_file=/Users/utibeabasi/Documents/AWS\ credentials/blog.pem ansible_user=ubuntu" > /Users/utibeabasi/Downloads/infra-team-test/ansible/inventory
