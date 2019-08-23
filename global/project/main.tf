terraform {
  # Intentionally empty. Will be filled by Terragrunt.
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
}

#Permissions needed
# Project Creator (org level)
# Project Deletion? (org level)
# Service Usage Admin (org level)
resource "google_project" "project" {
 name            = var.project_name
 project_id      = var.project_id
 billing_account = var.billing_account
 org_id          = var.org_id
}

resource "google_project_services" "project" {
 project = "${google_project.project.project_id}"
 services = [
   "compute.googleapis.com",
   "oslogin.googleapis.com"
 ]
 disable_on_destroy = false
}