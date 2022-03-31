output "controlplane_node_ips" {
  description = "List of IP's for the controlplane nodes"
  value = module.controlplane_nodes.node_ips
}

output "node_ips" {
  description = "List of IP's for the nodes"
  value = module.nodes.node_ips
}