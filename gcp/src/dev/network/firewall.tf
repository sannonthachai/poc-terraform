resource "google_compute_firewall" "allow_http_https_rdp" {
  name    = "allow-http-https-rdp"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http-https-rdp"]
}
