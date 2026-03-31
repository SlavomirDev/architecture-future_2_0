output "hadoop_nodes_public_ips" {
  value = [
    for node in yandex_compute_instance.hadoop_nodes :
    node.network_interface[0].nat_ip_address
  ]
  description = "Публичные IP-адреса узлов Hadoop"
}

output "hadoop_nodes_internal_ips" {
  value = [
    for node in yandex_compute_instance.hadoop_nodes :
    node.network_interface[0].ip_address
  ]
  description = "Внутренние IP-адреса узлов Hadoop"
}

output "hadoop_nodes_names" {
  value = [
    for node in yandex_compute_instance.hadoop_nodes :
    node.name
  ]
  description = "Имена узлов Hadoop"
}

output "network_id" {
  value       = yandex_vpc_network.hadoop_net.id
  description = "ID созданной сети"
}

output "subnet_id" {
  value       = yandex_vpc_subnet.hadoop_subnet.id
  description = "ID созданной подсети"
}