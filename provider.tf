terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version=">=1.6.6" #this version is for Terraform Version, not aws
    cloud {
          organization = "MCIT-Nichelle"
        workspaces {
          name = "mcitaws"
      }
    }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}
