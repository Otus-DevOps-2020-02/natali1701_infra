variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

