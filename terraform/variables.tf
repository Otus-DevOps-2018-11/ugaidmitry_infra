variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west4-a"
}

variable public_key_path {
  description = "Path to the public key used for ssh acess"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "zone of creating instance"
  default     = "europe-west4-a"
}
