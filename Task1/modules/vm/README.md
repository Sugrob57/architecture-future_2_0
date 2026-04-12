# VM Module для Terraform

Универсальный модуль для создания виртуальных машин с возможностью настройки под разные окружения.

## Возможности
- Создание ВМ с произвольным количеством CPU и RAM
- Автоматическое создание flavor на основе параметров
- Подключение основного и дополнительных дисков
- Настройка SSH доступа
- Поддержка нескольких окружений через .tfvars

## Входные параметры

| Параметр | Тип | Обязательный | Описание |
|----------|-----|--------------|----------|
| vm_name | string | Да | Имя виртуальной машины |
| vcpus | number | Да | Количество ядер CPU |
| ram_mb | number | Да | Объём RAM в мегабайтах |
| disk_size_gb | number | Да | Размер основного диска в ГБ |
| subnet_id | string | Да | ID подсети |
| ssh_public_key | string | Да | Публичный SSH ключ |
| image_id | string | Нет | ID образа ОС (по умолчанию: ubuntu-20.04) |
| availability_zone | string | Нет | Зона доступности |
| additional_disks | map(number) | Нет | Дополнительные диски |

## Выходные данные

| Параметр | Описание |
|----------|----------|
| vm_id | ID созданной ВМ |
| vm_name | Имя ВМ |
| vm_ip_address | IP-адрес ВМ |
| attached_disk_id | ID основного диска |
| additional_disks_ids | ID дополнительных дисков |
| flavor_used | Используемая конфигурация CPU/RAM |

## Пример использования

```hcl
module "my_vm" {
  source = "../../modules/vm"
  
  vm_name       = "test-vm"
  vcpus         = 2
  ram_mb        = 4096
  disk_size_gb  = 50
  subnet_id     = "subnet-12345"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}


## 2. Конфигурации окружений

### Общий провайдер для всех окружений

Создайте `envs/providers.tf` (можно скопировать в каждое окружение):

```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51"
    }
  }
}

provider "openstack" {
  # Настройки берутся из переменных окружения OS_*
  # или можно указать явно:
  # auth_url    = "https://cloud.example.com:5000/v3"
  # user_name   = "your-username"
  # password    = var.os_password
  # tenant_name = "your-project"
  # region      = "RegionOne"
}