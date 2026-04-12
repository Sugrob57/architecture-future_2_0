output "instance_id" {
  value     = yandex_compute_instance.vm.id
  description = "ID созданной виртуальной машины"
}

output "instance_name" {
  value     = yandex_compute_instance.vm.name
  description = "Имя виртуальной машины"
}

output "public_ip" {
  value     = yandex_compute_instance.vm.network_interface.0.nat_ip_address
  description = "Публичный IP-адрес ВМ"
}

output "private_ip" {
  value     = yandex_compute_instance.vm.network_interface.0.ip_address
  description = "Приватный IP-адрес ВМ"
}

output "disk_id" {
  value     = yandex_compute_disk.additional_disk.id
  description = "ID дополнительного диска"
}

output "disk_name" {
  value     = yandex_compute_disk.additional_disk.name
  description = "Имя дополнительного диска"
}
