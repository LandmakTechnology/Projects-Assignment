variable "ami_id" {
  default     = "ami-0629230e074c580f2"
  description = "The instance AMI id"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The VPC to associate the security group with"
  default     = "vpc-30149b5b"
}