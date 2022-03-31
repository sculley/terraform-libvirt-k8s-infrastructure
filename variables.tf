variable "cloud_init_network_config" {
  description = "The cloud-init network config used to build the common cloud-init image when creating nodes"
  type = string
  default = "null" 
}

variable "cloud_init_user_data" {
  description = "The cloud-init config used to build the common cloud-init image when creating nodes"
  type = string
  default = null
  sensitive = true
}

variable "node_public_key" {
  description = "The cloud-user public key used for authentication added to the controlplane and nodes_groups"
  type = string
  default = ""
  sensitive = true
}

variable "node_passwd" {
  description = "The cloud-user password added to the controlplane and nodes_groups"
  type = string
  default = ""
  sensitive = true
}

variable "controlplane_settings" {
  description = "The controlplane settings applied to the hosts"
  type = any
  default = {}
}

variable "controlplane_node_group_defaults" {
  description = "The default controlplane settings applied to the hosts if none are provided in the controlplane_settings parameter"
  type = any
  default = {
    create = true
    count = 2
    memory = "2048"
    vcpu = "1"
    os_source = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  }
}

variable "node_group_settings" {
  description = "The node_group settings applied to the hosts"
  type = any
  default = {}
}

variable "node_group_defaults" {
  description = "The default node_group settings applied to the hosts if none are provided in the node_group_settings parameter"
  type = any
  default = {
    create = false
    count = 3
    memory = "4096"
    vcpu = "1"
    os_source = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  }
}

variable "pool" {
  description = "The libvirt pool to store node disks/volumes"
  type = string
}