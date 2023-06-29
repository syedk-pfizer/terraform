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

resource "aws_instance" "aws_variables_datatype_type_constraint" {
  ami           = var.image_id
  instance_type = "t2.micro"
  
  tags = {
    Name = "HelloWorld_by_type_constraint"
  }
}

resource "aws_instance" "aws_variables_datatype_list" {
  ami           = var.image_id
  instance_type = var.list_var[0]
  
  tags = {
    Name = "HelloWorld_by_datatype_list"
  }
}

resource "aws_instance" "aws_variables_datatype_map" {
  ami           = var.map_var["ap-south-1"]["ami"]
  instance_type = var.map_var["ap-south-1"]["instancetype"]
  
  tags = {
    Name = "HelloWorld_by_datatype_map"
  }
}
