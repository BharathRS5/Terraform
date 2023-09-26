terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # we can give acces key and security key here, but don't provide here as security problem as we are pushing code to git so configuered on terminal.
  region = "us-east-1"
}