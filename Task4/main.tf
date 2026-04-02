terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

# Данные образа Ubuntu 22.04 LTS
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

# Сеть для Hadoop-кластера
resource "yandex_vpc_network" "hadoop_net" {
  name        = "hadoop-network"
  description = "Сеть для Hadoop-кластера"
}

# Подсеть в зоне ru-central1-a
resource "yandex_vpc_subnet" "hadoop_subnet" {
  name           = "hadoop-subnet"
  description    = "Подсеть для Hadoop-узлов"
  zone           = var.zone
  network_id     = yandex_vpc_network.hadoop_net.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

# Создание виртуальных машин для Hadoop-кластера
resource "yandex_compute_instance" "hadoop_nodes" {
  count = var.node_count

  name        = "hadoop-${count.index + 1}"
  hostname    = "hadoop-${count.index + 1}"
  description = "Узел Hadoop-кластера"

  zone = var.zone

  resources {
    cores  = var.cores_per_node
    memory = var.memory_per_node
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.disk_size_gb
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.hadoop_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_ssh_key_path)}"
  }
}