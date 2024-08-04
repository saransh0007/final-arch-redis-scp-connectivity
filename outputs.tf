output "host-network_selflink" {
  value       = module.vpc-host.self_link
  description = "self link of the host network/vpc created"
}

output "scp-name" {
  value       = module.service-connection-policy.id
  description = "name os the created service connection policy"
}

output "redis-cluster-endpoints" {
  value       = module.redis_cluster.discovery_endpoints
  description = "name os the created service connection policy"
}

output "firewall-rules" {
  value = module.firewall_rules.firewall_rules_ingress_egress

}

output "vm-name" {
  value = module.simple-vm-example.id
}