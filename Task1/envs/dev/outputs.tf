output "dev_vm_info" {
  value = {
    id         = module.dev_vm.vm_id
    name       = module.dev_vm.vm_name
    ip_address = module.dev_vm.vm_ip_address
    flavor     = module.dev_vm.flavor_used
  }
}

output "dev_disks" {
  value = {
    main      = module.dev_vm.attached_disk_id
    additional = module.dev_vm.additional_disks_ids
  }
}