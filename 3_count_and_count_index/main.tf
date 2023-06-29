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

# this creates two instances with names from list variable instance_name
resource "aws_instance" "count_and_count_index" {
  ami           = var.image_id
  instance_type = "t2.micro"
  count = 2
  
  tags = {
    Name = var.instance_name[count.index]
  }
}

