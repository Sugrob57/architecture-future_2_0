# Как скачать модули через другой хост

### На хосте с доступом к ресурсам

```bash
wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip

unzip terraform_1.7.5_linux_amd64.zip

chmod +x terraform
```

```hcl
nano main.tf
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.100" # или твоя версия
    }
  }
}
```

```bash
./terraform init
./terraform providers mirror ./providers-mirror
```

-----------
### На хосте, где нужен рабочий модуль

```bash
mkdir -p ~/.terraform.d
nano ~/.terraform.d/terraform.rc
```

```hcl
provider_installation {
  filesystem_mirror {
    path    = "/home/user/providers-mirror"
  }
  direct {
    exclude = ["yandex-cloud/yandex"]
  }
}
```

```bash
terraform init
```