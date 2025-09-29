provider "aws" {
  region = "ap-south-1"
}

# S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-12345" # change name (must be globally unique)

  tags = {
    Name        = "terraform-state"
    Environment = "dev"
  }
}

# Enable versioning for S3 bucket (best practice)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-locks"
    Environment = "dev"
  }
}
