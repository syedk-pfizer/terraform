terraform {
  required_providers {
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


resource "github_repository" "terraform_example" {
  name        = "terraform_example"
  description = "My awesome codebase"

  visibility = "public"
}
