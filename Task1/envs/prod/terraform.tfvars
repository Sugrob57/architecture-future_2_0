# PROD окружение - максимальные ресурсы, отказоустойчивость
vm_name         = "prod-vm-01"
vcpus           = 8
ram_mb          = 16384
disk_size_gb    = 200
subnet_id       = "subnet-prod-11223"
ssh_public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... user@prod"
image_id        = "ubuntu-22.04-lts"
availability_zone = "ru-msk-3"

# Максимальный набор дисков для production
additional_disks = {
  "data"     = 200
  "logs"     = 100
  "backup"   = 500
  "archive"  = 1000
}