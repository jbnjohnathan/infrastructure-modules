terraform {
  backend "gcs" {}
}

provider "google" {
}

resource "google_compute_vpn_tunnel" "tunnel_home" {
  name          = var.vpn_tunnel_name
  peer_ip       = var.vpn_peer_ip
  shared_secret = var.vpn_shared_secret
  region        = var.vpn_region
  ike_version   = "2"

  target_vpn_gateway = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
  remote_traffic_selector = [var.vpn_remote_subnet]
  local_traffic_selector = ["0.0.0.0/0"]
  depends_on = [
    "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",
  ]
  
}

resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = "${var.vpn_tunnel_name}-vpn_gateway"
  #network = "${google_compute_network.jbncentral-vpc.self_link}"
  project        = var.vpn_project
  network        = var.vpn_network
  region         = var.vpn_region
}


resource "google_compute_address" "vpn_static_ip" {
  name   = "${var.vpn_tunnel_name}-vpn_static-ip"
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target     = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}

resource "google_compute_route" "tunnel_home_route" {
  name       = "${var.vpn_tunnel_name}_vpn_route-1"
  #network    = "${google_compute_network.jbncentral-vpc.name}"
  project        = var.vpn_project
  network        = var.vpn_network
  dest_range = var.vpn_remote_subnet
  priority   = 1000

  next_hop_vpn_tunnel = "${google_compute_vpn_tunnel.tunnel_home.self_link}"
}