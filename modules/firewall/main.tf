resource "google_compute_firewall" "firewall" {
  name    = "atlantis-firewall"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", var.atlantis_port]
  }
  source_tags = [
    module.instance.network_tags
  ]
}
