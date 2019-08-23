resource "google_compute_network" "shared-vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                = var.vpc_project
}

resource "google_compute_shared_vpc_host_project" "hostproject" {
  project = var.vpc_project
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = var.vpc_subnetwork_name
  ip_cidr_range = var.vpc_subnetwork_cidr
  region        = "europe-west1"
  network       = var.vpc_name
  secondary_ip_range {
    range_name    = var.vpc_subnetwork_secondary_name
    ip_cidr_range = var.vpc_subnetwork_secondary_cidr
  }
}