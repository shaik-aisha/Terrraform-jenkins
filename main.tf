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
