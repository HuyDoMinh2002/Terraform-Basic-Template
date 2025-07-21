terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Provider Setting
provider "github" {
  token = var.github_token # or `GITHUB_TOKEN'
  owner = var.github_owner
}

provider "google" {
  project     = var.project_id
  region      = var.gcp_project_region
  zone        = var.gcp_project_zone           # Choose your zone
  credentials = file(var.gcp_credentials_file) # Path to your service account key file

}

# Enable Google API (need ~2 mins each)
# Compute API (VPC, Subnet, Firewall rules, VMs)
resource "google_project_service" "compute" {
  project            = var.project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

# Create GitHub Repository
resource "github_repository" "front-end" {
  name        = "front-end-repo"
  description = "My awesome codebase"
  visibility  = "public"
  auto_init   = true
}

# Network Link
module "network" {
  source             = "./modules/network"
  project_id         = var.project_id
  gcp_project_region = var.gcp_project_region
}

# Compute Link
module "compute" {
  source                 = "./modules/compute"
  subnetwork             = module.network.subnet_id
  compute_api_dependency = google_project_service.compute
}






