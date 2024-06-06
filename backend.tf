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
