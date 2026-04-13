# Задание 2. Интеграция с CI/CD и удалённым хранением состояния

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

Github Actions pipeline описан в файле [terraform.yml](/.github/workflows/terraform.yml)

### Пример запуска

