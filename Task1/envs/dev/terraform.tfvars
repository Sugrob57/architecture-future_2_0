# DEV окружение - минимальные ресурсы
vm_name         = "dev-vm-01"
vcpus           = 2
ram_mb          = 2048
disk_size_gb    = 30
subnet_id       = "subnet-dev-12345"
ssh_public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... user@dev"
image_id        = "ubuntu-22.04"
availability_zone = "ru-msk-1"

# Дополнительный диск для тестов
additional_disks = {
  "data" = 20
  "logs" = 10
}