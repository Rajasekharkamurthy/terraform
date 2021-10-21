# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 1.0 like 1.0 etc and < 2.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-stacksimplify10638"
    key    = "dev/terraform.tfstate"
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "terraform-dev-state-table"    
    
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"

}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/