terraform {
  backend "azurerm" {
    resource_group_name  = "path0053-githubactions-rg"
    storage_account_name = "path0053githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }

  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
  use_oidc             = true
}