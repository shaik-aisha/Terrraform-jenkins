# variables.tf
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  default     = "MyFreeTierEC2"
}
