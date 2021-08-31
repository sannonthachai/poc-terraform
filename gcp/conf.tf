provider "google" {
  credentials = file("gcp_credential.json")
  project     = "banded-advice-278311"
  region      = "asia-southeast1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "first-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}
