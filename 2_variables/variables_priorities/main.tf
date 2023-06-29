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

resource "aws_instance" "terraform_instance" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld"
  }
}
