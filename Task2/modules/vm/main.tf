terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_disk" "disk" {
  name = "${var.vm_name}-disk"
  size = var.disk_size
  zone = var.zone
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name
  zone = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}