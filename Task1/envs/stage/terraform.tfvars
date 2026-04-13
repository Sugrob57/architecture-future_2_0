vm_name   = "stage-vm"
cores     = 4
memory    = 4
disk_size = 10

zone      = "ru-central1-a"
subnet_id = "your-subnet-id"
image_id  = "your-image-id"
yc_token  = "" 
cloud_id  = ""
folder_id = ""

ssh_key = "${file("~/.ssh/id_rsa.pub")}"