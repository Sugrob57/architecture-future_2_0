terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.197.0"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name   = var.vm_name
  cores     = var.cores
  memory    = var.memory
  disk_size = var.disk_size
  subnet_id = var.subnet_id
  ssh_key   = var.ssh_key
  zone      = var.zone
  image_id  = var.image_id
}