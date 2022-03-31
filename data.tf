# generate the cloud_init file into the ubuntu image
data "template_file" "user_data" {
  template = templatefile("${path.module}/templates/cloudinit/cloud_init.cfg.tpl", {
    passwd = sha512(var.node_passwd)
    ssh_authorized_keys = var.node_public_key
  })
}

# generate the network_config file to build into the ubuntu image
data "template_file" "network_config" {
  template = templatefile("${path.module}/templates/cloudinit/network_config.cfg.tpl", {})
}