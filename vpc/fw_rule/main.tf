terraform {
  backend "gcs" {}
}

provider "google" {
  project = "jbncentral"
}


resource "google_compute_firewall" "fwrule" {
  name    = "${var.name}"
  network = "${google_compute_network.jbncentral-vpc.self_link}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.tcp_destination_port}"]
  }
  source_ranges = ["${var.source_ip}"]
  target_tags = ["${var.target_tag}"]
}