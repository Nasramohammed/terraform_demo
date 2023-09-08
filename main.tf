terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
  }

  cloud {
    organization = "nasra_mohammed"

    workspaces {
      name = "terraform_demo"
    }
  }
}







