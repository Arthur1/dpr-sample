provider "aws" {
  region = "ap-northeast-1"
}

provider "github" {}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

locals {
  tags = {
    "Owner" : "arthur-1",
    "Managed-by" : "terraform",
  }
}
