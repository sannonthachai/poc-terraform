resource "google_project_iam_member" "storage_admin" {
  project = module.variables.dev.project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.hcp["hcp-buckets-admin"].email}"
}

resource "google_project_iam_member" "service_account_admin" {
  for_each = toset([
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountAdmin",
  ])
  project = module.variables.dev.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.hcp["hcp-service-account-admin"].email}"
}

resource "google_project_iam_member" "network_admin" {
  project = module.variables.dev.project
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.hcp["hcp-network-admin"].email}"
}
