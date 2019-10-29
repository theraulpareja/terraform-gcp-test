# Look at the example here https://www.terraform.io/docs/providers/google/getting_started.html

provider "google" {
  project = "my-fancy-gcp-project"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}
resource "google_compute_instance" "vm_instance" {
  name         = "test-image"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${google_compute_network.vpc_network.self_link}"
    access_config {
    }
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "test-network"
  auto_create_subnetworks = "true"
}
