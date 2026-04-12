output "stage_vm_info" {
  value = {
    id         = module.stage_vm.vm_id
    name       = module.stage_vm.vm_name
    ip_address = module.stage_vm.vm_ip_address
    flavor     = module.stage_vm.flavor_used
  }
}

output "stage_disks" {
  value = module.stage_vm.additional_disks_ids
}