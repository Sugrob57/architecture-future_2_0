vm_name   = "dev-vm"
cores     = 2
memory    = 2
disk_size = 10

zone      = "ru-central1-a"
subnet_id = "your-subnet-id"
image_id  = "your-image-id"
yc_token  = ""  # Пустая строка, значение будет подставлено из окружения
cloud_id  = ""
folder_id = ""

# "${file("~/.ssh/id_rsa.pub")}"

ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGwkcQfwCuk0hd6Q1ksYjNgxht3+ATL3Si16uxLX1KiSw5Q+9yVPOt08ZBY2JdUjwhql8d0LccZ83e/5cxVFIpMjIH5jdFcQZz7f17iEjuch+y8dDe1wwGw8Q3kdcpS+/IDCnCG6a9WHiTQDjLEmtSDa5BQYeqFQm+JwANP1X2bYLGxKfsvXatMC6Ch18PV3C8vR/C8wTlb46sFPUAScMWJVFOlPrYNwWwxl5w2j6euL88cGIA+NFkSADfgb6n8dL8X2qninNpDqShgHjNodvdGgeEWqOZyb/oI5llsqsRPT/Aii4I9G2kiI4q06wnhzcUq41LRx0SJNOd8aIDUhc3R8as5CYiMESW+H5xR/5b35QD+kLO++/sbkiJRPICf1EHE/mSGhKBxC5YWVTb2PmOESQG/K2/DFmZoEuvq5gV+uD6jQ6ppgDfPO33pZi5frTuZ2/vgc+4MUjHycklPxeayUhq4jg9bufqv1K7anGu6nuwKeliLj19gnj9syNf30Smvjviht3nhbIozRrTyEtUfe+B0WSqf6Q7z0/Gz/N2JaYxPG/DJKCKBm74JS4IgfcM90pqVgozF2ShD4kFmc+2h63DsjP7D5wsL+UMGqUoGPVOMD45Q6uzAFPGFLUqJDdJoyWvUQjLKwEEFj29zNRR/9l7KWsSTqENLXzfBu2duw==" 

