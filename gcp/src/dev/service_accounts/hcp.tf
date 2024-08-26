locals {
  hcp_service_accounts = [
    {
      account      = "hcp-buckets-admin"
      display_name = "HCP-Buckets-Admin"
    },
    {
      account      = "hcp-service-account-admin"
      display_name = "HCP-Service-Account-Admin"
    },
    {
      account      = "hcp-network-admin"
      display_name = "HCP-Network-Admin"
    },
    {
      account      = "hcp-container-admin"
      display_name = "HCP-container-Admin"
    },
  ]
}

resource "google_service_account" "hcp" {
  for_each = {
    for index, sa in local.hcp_service_accounts :
    sa.account => sa
  }
  account_id   = each.value.account
  display_name = each.value.display_name
}
