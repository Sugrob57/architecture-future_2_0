resource "yandex_compute_instance" "vm" {
  name        = "vm-${uuid()}"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.system_disk.id
    #initialize_params {
    #  image_id = var.image_id
    #  size     = 10 # Системный диск 10 ГБ
    #}
  }

  secondary_disks {
    disk_id = yandex_compute_disk.additional_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}

resource "yandex_compute_disk" "additional_disk" {
  name   = "additional-disk-${uuid()}"
  zone   = var.zone
  size   = var.disk_size
  type   = "network-ssd"
}

resource "yandex_compute_disk" "system_disk" {
  name = "system-disk-${uuid()}"
  type = "network-ssd"
  zone = var.zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size = 15
}
