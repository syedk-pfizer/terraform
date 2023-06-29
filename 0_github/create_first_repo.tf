terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Environment variable should be present named GITHUB_TOKEN
# export GITHUB_TOKEN="token"
provider "github" {
  
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}


resource "github_repository" "terraform_example" {
  name        = "terraform_example"
  description = "My awesome codebase"

  visibility = "public"
}
