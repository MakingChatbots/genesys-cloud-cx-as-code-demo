terraform {
  required_version = "~> 1.12.2"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = "~> 1.68.3"
    }
  }
  backend "local" {}
}

// Provider docs: https://registry.terraform.io/providers/MyPureCloud/genesyscloud/latest/docs
provider "genesyscloud" {}
