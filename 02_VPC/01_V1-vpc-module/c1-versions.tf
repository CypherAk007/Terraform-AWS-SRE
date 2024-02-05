# This is block 

terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>5.3"
    }
  }
}

provider "aws" {
  region = var.aws_region
}