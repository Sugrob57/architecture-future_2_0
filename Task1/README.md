# Задание 1. Модульная инфраструктура для нескольких сред

# Решение

## Предварительные требования
- Установить Terraform (>= 1.0)
- Доступ к Yandex Cloud
- Скачать модуль yandex-cloud (Если нет доступа, то можно так: [Как перенести модули с другого хоста](/Task1/README2.md))
- Настроить переменные окружения для провайдера:
  [Начало работы с Terrafom](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart?utm_referrer=https%3A%2F%2Fyandex.ru%2Fsearch%3Fclid%3D1906725%26text%3Dterraform%2Byandex%2Bcloud%26lr%3D21621)

```bash
export YC_CLOUD_ID=<cloudId>
export YC_FOLDER_ID=<folderId>
export YC_SERVICE_ACCOUNT_KEY_FILE=~/Task1/authorized_key.json
```

## Описание
Модуль создаёт виртуальную машину в Yandex Cloud с:
- boot-диском
- дополнительным диском
- сетевым интерфейсом
- SSH доступом

## Параметры

| Параметр | Описание |
|----------|----------|
| vm_name | имя ВМ |
| cores | CPU |
| memory | RAM |
| disk_size | размер диска |
| subnet_id | ID подсети |
| ssh_key | публичный SSH ключ |
| zone | зона |
| image_id | образ |

## Запуск

```bash
cd envs/<environment>
terraform init
terraform plan
terraform apply -auto-approve
```

### Удаление ресурсов

```bash
cd envs/<environment>
terraform destroy
```

## Outputs

- vm_id
- external_ip
- vm_name
- disk_id

### Проверка outputs

```bash
terraform output
terraform output -json
```