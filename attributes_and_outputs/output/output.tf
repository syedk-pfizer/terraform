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

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_s3_bucket" "s3_dev" {
  bucket = "my-dev-tf-bucket-402"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# in value if #aws_eip.lb all attributes are returned 
# eip_id = {
#   "address" = tostring(null)
#   "allocation_id" = "eipalloc-048c4ab862cb58eae"
#   "associate_with_private_ip" = tostring(null)
#   "association_id" = ""
#   "carrier_ip" = ""
#   "customer_owned_ip" = ""
#   "customer_owned_ipv4_pool" = ""
#   "domain" = "vpc"
#   "id" = "eipalloc-048c4ab862cb58eae"
#   "instance" = ""
#   "network_border_group" = "ap-south-1"
#   "network_interface" = ""
#   "private_dns" = tostring(null)
#   "private_ip" = ""
#   "public_dns" = "ec2-65-1-78-69.ap-south-1.compute.amazonaws.com"
#   "public_ip" = "65.1.78.69"
#   "public_ipv4_pool" = "amazon"
#   "tags" = tomap({})
#   "tags_all" = tomap({})
#   "timeouts" = null /* object */
#   "vpc" = true
# }
# else if u specify aws_eip.lb.id
# eip_id = "eipalloc-048c4ab862cb58eae"
output "eip_id" {
  value = aws_eip.lb.id
}

output "bucket_arn" {
  value = aws_s3_bucket.s3_dev.arn
}
