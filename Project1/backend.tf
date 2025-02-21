terraform {
  backend "azurerm" {
    resource_group_name  = "rg-project1-eastus-001"               # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "satfstatefileproject1"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstatefile"                          # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"               # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    client_id            = "00000000-0000-0000-0000-000000000000" # Can also be set via `ARM_CLIENT_ID` environment variable.
    client_secret        = "************************************" # Can also be set via `ARM_CLIENT_SECRET` environment variable.
    subscription_id      = "00000000-0000-0000-0000-000000000000" # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    tenant_id            = "00000000-0000-0000-0000-000000000000" # Can also be set via `ARM_TENANT_ID` environment variable.
  }
}