terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"

    }
  }


backend "azurerm" {
    resource_group_name  = "CKRG"
    storage_account_name = "chanchalstg"
    container_name       = "chanchalcont1"
    key                  = "imp.terraform.tfstate"
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}