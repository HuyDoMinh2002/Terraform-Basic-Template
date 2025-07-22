resource "google_compute_instance" "huy_instance" {
  name         = "huy-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.subnetwork

    access_config {
      // This sub-block create and attaches and ephemeral public IP 
    }
  }

  metadata_startup_script = file("./scripts/vm-startup.sh")

  depends_on = [var.compute_api_dependency]

}