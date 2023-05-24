provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "vpc-subnet"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = var.subnet_cidr
}

# Create a Compute instance with a public IP
resource "google_compute_instance" "instance" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.self_link

    access_config {
      // Use ephemeral IP address
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y ansible

    # Clone your Ansible playbook repository
    git clone <ansible-playbook-repo-url>

    # Run the Ansible playbook
    cd <ansible-playbook-directory>
    ansible-playbook playbook.yml
  EOT
}

# Configure the network firewall
resource "google_compute_firewall" "firewall" {
  name    = "allow-ssh-and-atlantis"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "4141"]
  }

  source_ranges = ["0.0.0.0/0"]
}
