terraform {
  backend "s3" {
    bucket         = "terraform-state-utibe"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_access"
  }
}

resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = "blog"
  vpc_security_group_ids = [aws_security_group.allow_http.id]
}