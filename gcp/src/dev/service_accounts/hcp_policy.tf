resource "google_project_iam_member" "objectUser" {
  project = module.variables.dev.project
  role    = "roles/storage.objectUser"
  member  = "serviceAccount:${google_service_account.hcp["hcp-buckets-user"].email}"
}

resource "google_project_iam_member" "serviceAccountCreator" {
  project = module.variables.dev.project
  role    = "roles/iam.serviceAccountCreator"
  member  = "serviceAccount:${google_service_account.hcp["hcp-service-account-creator"].email}"
}
