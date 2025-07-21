variable "compute_api_dependency" {
  description = "Dependency on compute API enablement"
  type        = any
}

variable "subnetwork" {
  description = "Subnetwork self link for the VM"
  type        = string
}