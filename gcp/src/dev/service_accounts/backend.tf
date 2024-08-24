terraform {
  cloud {
    organization = "sannon-poc-terraform"

    workspaces {
      project = "GCP-Development"
      name    = "DEV-Service-Accounts"
    }
  }
}

provider "google" {
  project = module.variables.dev.project
}

module "variables" {
  source = "../variables"
}
