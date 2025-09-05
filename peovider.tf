terraform {
	required_providers { 
		azurerm = {
		source = "hashicorp/azurerm"
		version =  "~> 4.0"

				}
			}
		}
  provider "azurerm" {
	features {}
subscription_id = "580e9412-8b9e-42cf-b916-a0ba307b8003"

  }