resource "google_compute_network" "vpc_network" {
  name                    = "gke-vpc-network"
  auto_create_subnetworks = false
  depends_on              = [null_resource.prep]
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "gke-vpc-subnetwork"
  ip_cidr_range = "192.168.0.0/16"
  region        = module.variables.dev.region
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "pods-subnet"
    ip_cidr_range = "10.0.0.0/16"
  }
  secondary_ip_range {
    range_name    = "services-subnet"
    ip_cidr_range = "10.1.0.0/16"
  }
  depends_on = [
    google_compute_network.vpc_network,
  ]
}
