resource "google_service_account_key" "hcp_buckets_user_key" {
  service_account_id = google_service_account.hcp["hcp-buckets-user"].email
}

resource "google_service_account_key" "hcp_service_account_creator_key" {
  service_account_id = google_service_account.hcp["hcp-service-account-creator"].email
}
