resource "random_password" "this_cloud_user" {
  count = var.cloud_user_pw == "" && var.cloud_init_user_data == "" ? 1 : 0
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "this_root_user" {
  count = var.root_pw == "" && var.cloud_init_user_data == "" ? 1 : 0
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "libvirt_pool" "this" {
  name = "kube_node_volumes"
  type = "dir"
  # apparmour either needs to be disabled or setup to read/write to this dir
  path = var.kube_node_volume_path
}

resource "libvirt_volume" "this_controlplane" {
  count = var.controlplane_count
  name   = "controlplane${count.index}"
  pool   = libvirt_pool.this.name
  source = var.os_source
  format = "qcow2"
}

resource "libvirt_volume" "this_dataplane" {
  count = var.dataplane_count
  name   = "controlplane${count.index}"
  pool   = libvirt_pool.this.name
  source = var.os_source
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "this" {
  name           = "commoninit.iso"
  user_data      = var.cloud_init_user_data != "" ? var.cloud_init_user_data : data.template_file.user_data.rendered
  network_config = var.cloud_init_network_config != "" ? var.cloud_init_network_config : data.template_file.network_config.rendered
  pool           = libvirt_pool.this.name
}

# test-vm
resource "libvirt_domain" "this_controlplane" {
  count = var.controlplane_count
  name   = "controlplane${count.index}"
  memory = var.controlplane_mem
  vcpu   = var.controlplane_vcpu

  cloudinit = libvirt_cloudinit_disk.this.id
  network_interface {
    hostname = "controlplane${count.index}"
    network_name = "default"
    wait_for_lease = true
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  disk {
    volume_id = "${element(libvirt_volume.this_controlplane.*.id, count.index)}"
  }
  video {
    type = "vga"
  }
}

resource "libvirt_domain" "this_dataplane" {
  count = var.dataplane_count
  name   = "dataplane${count.index}"
  memory = var.dataplane_memory
  vcpu   = var.dataplane_vcpu

  cloudinit = libvirt_cloudinit_disk.this.id
  network_interface {
    hostname = "dataplane${count.index}"
    network_name = "default"
    wait_for_lease = true
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  disk {
    volume_id = "${element(libvirt_volume.this_dataplane.*.id, count.index)}"
  }
  video {
    type = "vga"
  }
}