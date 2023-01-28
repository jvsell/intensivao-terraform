terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# terraform validate
# terraform fmt
# terraform plan -out="tfplan.out"
# terraform destroy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-w-tags
resource "aws_s3_bucket" "bucket1" {
  bucket = "jvsell-my-bucket" # Unique name over all AWS accounts

  tags = {
    Name        = "My first Terraform bucket"
    Environment = "Dev"
    Owner       = "João Vitor Sell"
    CreatedAt   = "28-01-2023"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket1.id
  acl    = "private"
}