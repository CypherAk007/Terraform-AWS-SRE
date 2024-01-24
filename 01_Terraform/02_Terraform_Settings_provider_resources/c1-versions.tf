# Terraform Block
terraform {
#   required_version = "~> 0.14"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
} 
# provider Block 

provider "aws" {
    # profile = "default"
    region = "us-east-1"
}