output "controlplane_node_ips" {
    description = "A list of ips for the controlplane nodes"
    value = "${flatten(libvirt_domain.this_controlplane.*.network_interface.0.addresses)}"
}

output "dataplane_node_ips" {
    description = "A list of ips for the dataplane nodes"
    value = "${flatten(libvirt_domain.this_dataplane.*.network_interface.0.addresses)}"
}