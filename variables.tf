variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "The GitHub username or organization name"
  type        = string
}


# GCP Variable
variable "gcp_project_region" {
  description = "The GCP project region"
  type        = string
}

variable "gcp_project_zone" {
  description = "The GCP project zone"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to the GCP service account key file"
  type        = string
}

variable "project_id" {
  description = "The GCP project id"
  type        = string
}

# Network Variable
variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

