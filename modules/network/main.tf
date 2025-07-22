# GCP-Network

# VPC
resource "google_compute_network" "vpc_network" {
    name = "huy-vpc"
    project = var.project_id
    auto_create_subnetworks = false # to turn off the default setting
}

# Subnets
# Subnet A
resource "google_compute_subnetwork" "subnet" {
  name          = "huy-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.gcp_project_region
  network       = google_compute_network.vpc_network.id
}

# Firewall
# Inbound rule
resource "google_compute_firewall" "allow-inbound-common" {
  name    = "allow-inbound-common"
  network = google_compute_network.vpc_network.name
  direction = "INGRESS" 

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh", "web"] # Any instances that have this tag will get apply this rule
}
