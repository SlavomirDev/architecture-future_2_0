# Yandex Cloud credentials
variable "yc_token" {
  description = "OAuth token for Yandex Cloud"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

# Зона размещения ресурсов
variable "zone" {
  description = "Зона доступности Yandex Cloud"
  type        = string
  default     = "ru-central1-a"
}

# Количество узлов Hadoop
variable "node_count" {
  description = "Количество виртуальных машин в Hadoop-кластере"
  type        = number
  default     = 3
}

# Количество ядер на каждом узле
variable "cores_per_node" {
  description = "Количество CPU на каждой ВМ"
  type        = number
  default     = 2
}

# Объём памяти на каждом узле (ГБ)
variable "memory_per_node" {
  description = "Объём RAM на каждой ВМ (ГБ)"
  type        = number
  default     = 4
}

# Размер диска (ГБ)
variable "disk_size_gb" {
  description = "Размер загрузочного диска (ГБ)"
  type        = number
  default     = 20
}

# Путь к публичному SSH-ключу
variable "public_ssh_key_path" {
  description = "Путь к файлу публичного SSH-ключа"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}