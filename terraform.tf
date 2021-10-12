terraform {
  backend "remote" {
    organization = "dansdomain"

    workspaces {
      name = "algonode"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}
