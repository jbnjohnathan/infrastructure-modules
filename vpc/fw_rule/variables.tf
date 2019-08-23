variable "name" {
  description = "The name of the FW rule"
  type        = string
}

variable "tcp_destination_port" {
  description = "The destination port to open"
  type        = string
  default = []
}

variable "source_ip" {
  description = "The source IP to open from"
  type        = string
  default = []
}

variable "target_tag" {
  description = "The tags to open to"
  type        = string
  default = []
}

variable "tcp_destination_port" {
  description = "The destination port to open"
  type        = string
  default = []
}