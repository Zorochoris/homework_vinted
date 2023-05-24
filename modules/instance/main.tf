resource "google_compute_instance" "instance" {
  name         = "my-instance"
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {
      nat_ip = google_compute_address.instance_public_ip.address
    }
  }

  metadata_startup_script = file("startup-script.sh")

  tags = ["atlantis"]
}

resource "google_compute_address" "instance_public_ip" {
  name = "my-instance-public-ip"
}
