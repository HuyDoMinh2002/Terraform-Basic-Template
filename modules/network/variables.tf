# modules/network/variables.tf

variable "network_name" {
  description = "Name of the VPC"
  type        = string
}

variable "project_id" {
  description = "The GCP project id"
  type = string
}

variable "gcp_project_region" {
  description = "The GCP project region"
  type = string
}