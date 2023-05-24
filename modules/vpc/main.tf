resource "google_compute_network" "vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "primary" {
  name          = "my-subnet"
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_cidr_block
}

output "primary_subnet_id" {
  value = google_compute_subnetwork.primary.self_link
}
