terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.12.0"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}

provider "ansible" {
  # Configuration options
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  #token      = var.AWS_TOKEN
  region     = var.AWS_REGION
}