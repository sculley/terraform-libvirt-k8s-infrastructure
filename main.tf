module "controlplane_nodes" {
  source = "./modules/controlplanes"

  # node config
  node_count = try(var.controlplane_settings.count, var.controlplane_node_group_defaults.count)
  memory = try(var.controlplane_settings.memory, var.controlplane_node_group_defaults.memory)
  vcpu = try(var.controlplane_settings.vcpu, var.controlplane_node_group_defaults.vcpu)
  os_source = try(var.controlplane_settings.os_source, var.controlplane_node_group_defaults.os_source)

  # disk/volume config
  cloud_init_network_config = var.cloud_init_network_config != "" ? var.cloud_init_network_config : data.template_file.network_config.rendered
  cloud_init_user_data = var.cloud_init_user_data != "" ? var.cloud_init_user_data : data.template_file.user_data.rendered
  pool = var.pool
  size = var.controlplane_vol_size
}

module "nodes" {
  source = "./modules/nodes"

  # node config
  node_count = try(var.node_group_settings.count, var.node_group_defaults.count)
  memory = try(var.node_group_settings.memory, var.node_group_defaults.memory)
  vcpu = try(var.node_group_settings.vcpu, var.node_group_defaults.vcpu)
  os_source = try(var.node_group_settings.os_source, var.node_group_defaults.os_source)

  # disk/volume config
  cloud_init_network_config = var.cloud_init_network_config != "" ? var.cloud_init_network_config : data.template_file.network_config.rendered
  cloud_init_user_data = var.cloud_init_user_data != "" ? var.cloud_init_user_data : data.template_file.user_data.rendered
  pool = var.pool
  size = var.dataplane_vol_size

  depends_on = [
    module.controlplane_nodes
  ]
}