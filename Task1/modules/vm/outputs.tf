output "vm_id" {
  value = yandex_compute_instance.vm.id
}

output "external_ip" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "vm_name" {
  value = yandex_compute_instance.vm.name
}

output "disk_id" {
  value = yandex_compute_disk.disk.id
}