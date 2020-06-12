variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west1-b"
}
variable disk_image {
  description = "Disk image"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-base-1587102199"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-base-1587102199"
}
variable source_ranges {
  description = "Allowed IP addresses"
  default = ["0.0.0.0/0"]
}
