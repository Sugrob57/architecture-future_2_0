# Задание 1. Модульная инфраструктура для нескольких сред

Вам нужно создать универсальный модуль Terraform, который можно использовать для разных окружений (dev, stage, prod).

1. Реализовать модуль vm_module (в папке modules/vm/) со следующими параметрами:
    - Количество ядер;
    - Объём RAM;
    - Подключаемый диск;
    - Subnet ID;
    - SSH-ключ.
2. Сформировать три окружения, каждое со своей конфигурацией:
    - /envs/dev/
    - /envs/stage/
    - /envs/prod/
3. В каждом окружении используйте свой .tfvars, подставляя разные параметры в модуль.

```
/TaskAdvanced1/
  ├── modules/
  │   └── vm/
  │       ├── main.tf
  │       ├── variables.tf
  │       └── outputs.tf
  └── envs/
      ├── dev/
      ├── stage/
      └── prod/ 
```

main.tf — ресурсы ВМ + подключаемый диск + сеть.
variables.tf — входные параметры модуля (см. интерфейс ниже).
outputs.tf — полезные выходы (id ВМ, ip-адрес, имя, id диска и т. д.).

Внутри модуля не должно быть никаких захардкоженных значений окружений — всё через переменные.

README.md описывает, что делает модуль, параметры, выходы и как его запустить для каждого окружения.

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