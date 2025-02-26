
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
     length = 32
     special = false
     upper = false
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}