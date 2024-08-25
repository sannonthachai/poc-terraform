resource "google_project_iam_member" "object_admin" {
  project = module.variables.dev.project
  role    = "roles/storage.objectAdmin"
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
