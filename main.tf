resource "aws_instance" "assath" {
  ami           = "ami-01b6d88af12965bb6"  # Amazon Linux 2
  instance_type = "t2.micro"                # Change to Free Tier
  tags = {
    Name = "MyGitactionsEC2"
  }
}
