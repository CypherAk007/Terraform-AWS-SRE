terraform {
  required_version = "~>1.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}