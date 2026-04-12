variable "cores" {
  description = "Количество ядер процессора"
  type        = number
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number
}

variable "disk_size" {
  description = "Размер подключаемого диска в ГБ"
  type        = number
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_key" {
  description = "SSH-ключ для доступа к ВМ"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "image_id" {
  description = "ID образа ОС"
  type        = string
  default     = "fd8388j6s26l6ov2tjjj" # Ubuntu 20.04 LTS
}


data "yandex_compute_image" "ubuntu" { 
  family = "ubuntu-2204-lts"
} 