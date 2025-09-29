provider "aws" {
  region = var.aws_region
}

# Latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# EC2 instance
resource "aws_instance" "assath" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_type = "gp2"
    encrypted   = true
  }
}
