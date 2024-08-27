# resource "google_compute_address" "global_ip" {
#   name         = "gke-global-ip"
#   address_type = "EXTERNAL"
#   region       = module.variables.dev.region
#   address      = "192.168.1.10"
# }

# resource "null_resource" "wait_for_ip" {
#   depends_on = [google_compute_address.global_ip]
#   provisioner "local-exec" {
#     command = "sleep 30"
#   }
# }

# resource "google_compute_router" "nat_router" {
#   name    = "gke-nat-router"
#   network = google_compute_network.vpc_network.name
#   region  = module.variables.dev.region
# }

# resource "google_compute_router_nat" "nat" {
#   name                               = "gke-nat"
#   router                             = google_compute_router.nat_router.name
#   region                             = module.variables.dev.region
#   nat_ip_allocate_option             = "MANUAL_ONLY"
#   nat_ips                            = [google_compute_address.global_ip.self_link]
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#   depends_on = [
#     google_compute_address.global_ip,
#     google_compute_router.nat_router,
#     null_resource.wait_for_ip,
#   ]
# }
