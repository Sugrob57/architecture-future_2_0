# Задание 2. Интеграция с CI/CD и удалённым хранением состояния

Автоматизируйте развёртывание инфраструктуры через CI/CD, используя удалённое состояние (S3/Minio + backend). Конкретный инструмент для CI/CD не принципиален — вы можете реализовать задачу на Jenkins или в любой другой системе, которая вам ближе и привычнее по опыту.

Для этого:

1. Настройте Terraform-код с backend’ом с использованием S3-совместимого хранилища (minio, Yandex Object Storage, AWS S3).
2. Опишите pipeline с использованием .gitlab-ci.yml или GitHub Actions или другого CI/CD-инструмента:
    - terraform init
    - terraform plan
    - terraform apply (по кнопке или с флагом approval)


# Решение

## Предусловия

### Подготовить Secrets в GitHub

В repo => Settings => Secrets => Actions добавить:
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
S3_ENDPOINT        (например http://minio:9000)
TF_VAR_cloud_id
TF_VAR_folder_id
YC_SERVICE_ACCOUNT_KEY (содержимое authorized_key.json)
```

### Реализация 

Github Actions pipeline описан в файле [terraform.yml](/Task2/.github/workflows/terraform.yml)

### Пример запуска

![start](/Task2/ga1.png)
