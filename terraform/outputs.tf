output "ec2_domain" {
  value = aws_instance.web_server.public_dns
}

output "ec2_ip" {
  value = aws_instance.web_server.public_ip
}