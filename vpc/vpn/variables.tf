variable "vpn_tunnel_name" {
  description = "Name of VPN tunnel"
  type        = string
}

variable "vpn_peer_ip" {
  description = "The IP of the remote VPN endpoint not in GCP"
  type        = string
}

variable "vpn_shared_secret" {
  description = "Shared secret"
  type        = string
}

variable "vpn_region" {
  description = "Region to deplpy VPN tunnel to"
  type        = string
}

variable "vpn_remote_subnet" {
  description = "The subnets of the remote VPN endpoint not in GCP"
  type        = string
}

variable "vpn_remote_subnet" {
  description = "The subnets of the remote VPN endpoint not in GCP"
  type        = string
}