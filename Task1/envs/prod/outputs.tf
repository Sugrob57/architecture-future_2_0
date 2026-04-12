output "prod_vm_info" {
  value = {
    id         = module.prod_vm.vm_id
    name       = module.prod_vm.vm_name
    ip_address = module.prod_vm.vm_ip_address
    flavor     = module.prod_vm.flavor_used
    ssh_key    = module.prod_vm.ssh_key_name
  }
}

output "prod_disks" {
  value = {
    main = module.prod_vm.attached_disk_id
    additional = module.prod_vm.additional_disks_ids
  }
}

output "prod_summary" {
  description = "Полная информация о PROD ВМ"
  value = {
    vm_details = module.prod_vm
  }
  sensitive = true
}