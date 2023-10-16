terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["/home/raffi/.aws/credentials"]
  profile                  = "default"
}