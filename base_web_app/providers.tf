terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  cloud {
    organization = "SistemasCasa2"

    workspaces {
      name = "DemoHector"
    }
  }
}

provider "aws" {
  # alias = "value"
  region = var.aws_region
}

provider "random" {
  # Configuration options

}


