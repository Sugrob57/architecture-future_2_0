# Задание 1. Модульная инфраструктура для нескольких сред

# Решение


# Terraform VM Module для разных окружений

## Предварительные требования
- Установленный Terraform (>= 1.0)
- Доступ к OpenStack облаку (или другому провайдеру)
- Настроенные переменные окружения для провайдера:

```bash
  export OS_AUTH_URL=https://cloud.example.com:5000/v3
  export OS_USERNAME=your-username
  export OS_PASSWORD=your-password
  export OS_PROJECT_NAME=your-project
  export OS_REGION_NAME=RegionOne
```

## Запуск окружений

### DEV окружение

```bash
  cd envs/dev
terraform init
terraform plan
terraform apply -auto-approve
```


### Удаление ресурсов

```bash
cd envs/<environment>
terraform destroy
```

### Проверка outputs

```bash
terraform output
terraform output -json
```