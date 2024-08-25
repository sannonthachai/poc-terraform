resource "google_project_iam_member" "object_user" {
  project = module.variables.dev.project
  role    = "roles/storage.objectUser"
  member  = "serviceAccount:${google_service_account.hcp["hcp-buckets-user"].email}"
}

resource "google_project_iam_member" "service_account_creator" {
  project = module.variables.dev.project
  role    = "roles/iam.serviceAccountCreator"
  member  = "serviceAccount:${google_service_account.hcp["hcp-service-account-creator"].email}"
}

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
