resource "google_compute_network" "shared-vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                = var.vpc_project
}

resource "google_compute_shared_vpc_host_project" "hostproject" {
  project = var.vpc_project
}
