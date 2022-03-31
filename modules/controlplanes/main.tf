resource "libvirt_volume" "this" {
  count = var.node_count
  name   = "controlplane${count.index}"
  pool   = var.pool
  source = var.os_source
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "this" {
  count = var.cloud_init_user_data != "" ? 1 : 0

  name           = "controlplane-cloudinit.iso"
  user_data      = var.cloud_init_user_data 
  network_config = var.cloud_init_network_config
  pool           = var.pool
}

resource "libvirt_domain" "this" {
  count = var.node_count

  name   = "controlplane${count.index}"
  memory = var.memory
  vcpu   = var.vcpu

  cloudinit = libvirt_cloudinit_disk.this[0].id

  network_interface {
    hostname = "controlplane${count.index}"
    network_name = "default"
    wait_for_lease = true
  }

  disk {
    volume_id = "${element(libvirt_volume.this.*.id, count.index)}"
  }
  
  video {
    type = "vga"
  }
}