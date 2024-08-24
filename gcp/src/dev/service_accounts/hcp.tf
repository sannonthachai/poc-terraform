locals {
  hcp_service_accounts = [
    {
      account      = "hcp-buckets-user"
      display_name = "HCP-Buckets-User"
    },
    {
      account      = "hcp-service-account-creator"
      display_name = "HCP-Service-Account-Creator"
    }
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
