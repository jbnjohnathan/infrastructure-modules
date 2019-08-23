
resource "google_compute_instance" "vm" {
  name         = "${var.hostname}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  tags = ["ssh"]
  metadata = {
    ssh-keys = "johnathan:johnathan:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjsG2xXUkgrbH1t23LHXUMBQSrqdQ7Ao8cO78C7tCvbETO7lqOchqhu5igvF0A2fj3ewFHWq3DShAAWO1PvXqg6g+IKFLNPzC5vd71Tknw+VtpiHpZgedjF4UI6rGaUtZEQO7Hy3uNabPX90G6fYOln6/nmmQpwSrjSlNYHIylFyJE1k4gz0eAX7u++j8vBK3KcTrAKE8ff0rsorzrGngY7ztnl22OjqoRrWhB/dixk5I8Zsf/d/c7ikzaOwKV1OBYSCcYw7VoEMGKDMNTPlI1dKspAvaQgJbQcKZBFGSB+2EWHbn7kAQN8M8Yye8dTgyB6sIxBC5qAXdj1Or5UZCV google-ssh {\"userName\":\"johnathan@jbnitconsulting.se\",\"expireOn\":\"2019-08-10T14:19:47+0000\"}\njohnathan:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBGhFhB+fe8lc70vF+CO0NyvC8cQrRMUopi3N4Nl0ByHWPq3oLBmF8PDPCePl8RF02GGech73v3RQItL4s8vTM6g= google-ssh {\"userName\":\"johnathan@jbnitconsulting.se\",\"expireOn\":\"2019-08-10T14:19:45+0000\"}\njohnathan:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCBGyxtc85bmZ+BKubf/CAoPFddfAg/IJ+V0/q5tohPe7RsJ8zFl7HVQBw6i8GaDdshvXl7g/LpPi+HO4t8ilte0/liVrHLXg7xu5nR5oprGN1qjEaxmeP8LvxHUkcxMhiBvP06bYch5awt8YjxvdmCGLHU33A752u6/I88QwZshRwnZA+gIHKdNC/HWYx3qAFBqkup9GyFFGO+j0b5sDIShSd91g4uFrLm9rkaijsRZEjejsQV6FoIaONYga9OHcF2HleeCxhcYvVz2ZxH3P61FXadB6YHyuStGPoPR/aeTjSegde4B0Ye41A35Kz77P8HUZ3GlXnDMz6/K8NR8xH google-ssh {\"userName\":\"johnathan@jbnitconsulting.se\",\"expireOn\":\"2019-08-10T14:18:05+0000\"}\njohnathan:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBGaXwiR11WLuMDhDnG6YLj0MYeHdrTHQo1zMQ97yjcqmSi1HVhCBHXFH8bpmaYUetw0L10iR1gxP5gJD2MQkjbI= google-ssh {\"userName\":\"johnathan@jbnitconsulting.se\",\"expireOn\":\"2019-08-10T14:18:04+0000\"}\njohnathan:ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAtzfPgSb+QJQhHl+uIHS4M/n8bSFWvwDYUsqiMX8kdtsu7ijfxL+uVpj3HbAkHF3bjug/I0BF9bmuGG41QCtyYKsimB8b9djbxu0jwNRceANd7vxvpg2sdxGUBAZMb1I8zLB073zICqVz/2Gl8Ohr9cjriW/xPNoCTtY2SL18JSh+tvLFV/RxSUcEgz4Z4KZG3ZUjIncHJxipBLXxtOfbtZcru79TkupLjeO0tALVjZP0dFqs8+/zQGmx5ElyaosaA9h9gwb2hu75MDTbq84ikkirPCcgg/7joy09wWI+yABPjNBT7AyZqlY8/2FEPm3zqnKB06EDSMvfwcN5cPd3Nw== johnathan@jbnitconsulting.se"
}
  network_interface {
    subnetwork_project = "jbncentral"
    subnetwork    = "${var.subnetwork}"
    access_config {
    }
  }
}
