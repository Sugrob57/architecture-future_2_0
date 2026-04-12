# Использование модуля VM для окружения prod
module "prod_vm" {
  source = "../../modules/vm"
  
  vm_name       = var.vm_name
  vcpus         = var.vcpus
  ram_mb        = var.ram_mb
  disk_size_gb  = var.disk_size_gb
  subnet_id     = var.subnet_id
  ssh_public_key = var.ssh_public_key
  image_id      = var.image_id
  availability_zone = var.availability_zone
  additional_disks = var.additional_disks
  
  # Для prod окружения используем несколько зон доступности
  # (можно добавить count или for_each для масштабирования)
}