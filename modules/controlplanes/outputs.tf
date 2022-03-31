output "node_ips" {
    description = "List of IP's for the controlplane nodes"
    value = "${zipmap(flatten(libvirt_domain.this.*.name), flatten(libvirt_domain.this.*.network_interface.0.addresses))}"
}