# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=0.12.13"
  backend "s3" {
   bucket         = "state-tf-bucket"
   key            = "terraform.tfstate"
   region         = "sa-east-1"
   dynamodb_table = "aws-locks-terraform"
   encrypt        = true
  }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "sa-east-1"
  version = "~> 2.36.0"
}

# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source          = "./modules/bootstrap"
  bucket_name     = "state-tf-bucket"
  table_name      = "aws-locks-terraform"
}