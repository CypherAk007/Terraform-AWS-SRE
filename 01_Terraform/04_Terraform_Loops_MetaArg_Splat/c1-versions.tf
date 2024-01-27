terraform {
  required_version = "~>1.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.3"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.awsRegion
}

