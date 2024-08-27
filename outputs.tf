output "host-network_selflink" {
  value       = module.vpc-host[0].self_link
  description = "self link of the host network/vpc created"
}

output "scp-name" {
  value       = module.service-connection-policy.id
  description = "name of the created service connection policy"
}

output "firewall-rules" {
  value = module.firewall_rules.firewall_rules_ingress_egress

}

