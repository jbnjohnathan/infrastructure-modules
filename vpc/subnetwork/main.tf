terraform {
  # Intentionally empty. Will be filled by Terragrunt.
  backend "gcs" {}
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = var.vpc_subnetwork_name
  ip_cidr_range = var.vpc_subnetwork_cidr
  region        = var.vpc_subnetwork_region
  network       = var.vpc_name
  secondary_ip_range {
    range_name    = var.vpc_subnetwork_secondary_name
    ip_cidr_range = var.vpc_subnetwork_secondary_cidr
  }
}