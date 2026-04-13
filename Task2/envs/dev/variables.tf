variable "vm_name" {}
variable "cores" {}
variable "memory" {}
variable "disk_size" {}
variable "subnet_id" {}
variable "ssh_key" {}
variable "zone" {}
variable "image_id" {}

variable "yc_token" {
  description = "Yandex Cloud IAM token"
  type        = string
  sensitive   = true
  default     = ""  # Будет переопределено из окружения
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "Yandex Folder ID"
  type        = string
  default     = ""
}