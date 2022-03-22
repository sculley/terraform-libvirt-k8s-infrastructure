# generate the cloud_init file into the ubuntu image
data "template_file" "user_data" {
  template = templatefile("${path.module}/templates/cloudinit/cloud_init.cfg.tpl", {
    cloud_user_pw = sha512(var.cloud_user_pw)
    cloud_user_public_key = var.cloud_user_public_key
    root_pw = sha512(var.root_pw)
  })
}

# generate the network_config file to build into the ubuntu image
data "template_file" "network_config" {
  template = templatefile("${path.module}/templates/cloudinit/network_config.cfg.tpl", {})
}