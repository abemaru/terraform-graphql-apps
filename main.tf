terraform {
  required_providers {
    aws = {
        version = "~> 2.6"
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = var.aws_credentials_profile
  region = var.aws_region
}

module "appsync" {
    source = "./modules/appsync"
}

module "lambda" {
    source = "./modules/lambda"
}