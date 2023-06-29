terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

# condition ? true_val : false_val


resource "aws_instance" "condtional_expression_dev" {
  ami           = var.image_id
  instance_type = "t2.micro"
  count = var.istest == true ? 1 : 0
  
  tags = {
    Name = "dev"
  }
}

resource "aws_instance" "condtional_expression_prod" {
  ami           = var.image_id
  instance_type = "t2.medium"
  count = var.istest == false ? 1 : 0
  
  tags = {
    Name = "prod"
  }
}

# terraform plan -var=istest=false