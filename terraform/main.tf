provider "aws" {
  region = "ap-northeast-1"
}

locals {
  tags = {
    "Owner" : "arthur-1",
    "Managed-by" : "terraform",
  }
}
