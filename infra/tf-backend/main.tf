provider "azurerm" {
  features {}

  subscription_id = "448062d7-165d-4a76-80a4-232121e9a36e"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "pras0044-githubactions-rg"
    storage_account_name  = "pras0044githubactions"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "pras0044-githubactions-rg"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "pras0044githubactions"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
