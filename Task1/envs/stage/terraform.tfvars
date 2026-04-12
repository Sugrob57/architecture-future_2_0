# STAGE окружение - средние ресурсы, приближенные к production
vm_name         = "stage-vm-01"
vcpus           = 4
ram_mb          = 8192
disk_size_gb    = 100
subnet_id       = "subnet-stage-67890"
ssh_public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... user@stage"
image_id        = "ubuntu-22.04"
availability_zone = "ru-msk-2"

# Дополнительные диски для stage
additional_disks = {
  "data" = 50
  "logs" = 30
  "backup" = 100
}