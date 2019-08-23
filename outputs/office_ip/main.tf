locals {
  # Common tags to be assigned to all resources
  office_networks = [
    {
      "name": "New york"
      "key": "NY"
      "network": ["2.2.2.2/32"]
    },
    {
      "name": "London"
      "key": "LD"
      "network": ["1.1.1.1/32"]
    }
  ]
}


output "office_networks" {
  value       = flatten([for office in local.office_networks: office.network])
  description = "Netent office networks"
}