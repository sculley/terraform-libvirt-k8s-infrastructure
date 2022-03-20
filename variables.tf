variable "cloud_init_network_config" {
  description = "The cloud-init network config used to build the common cloud-init image when creating nodes"
  type = string
  default = ""
}

variable "cloud_init_user_data" {
  description = "The cloud-init config used to build the common cloud-init image when creating nodes"
  type = string
  default = ""
}

variable "cloud_user_public_key" {
  description = "The public key for the cloud-user"
  type = string
  default = ""
  sensitive = true
}

variable "cloud_user_pw" {
  description = "The password for the cloud-user"
  type = string
  default = ""
  sensitive = true
}

variable "controlplane_count" {
  description = "The number of controlplane nodes"
  type = number
  default = 1
}

variable "controlplane_mem" {
  description = "The controlplane nodes memory"
  type = string
  default = "2560"
}

variable "controlplane_vcpu" {
  description = "The controlplane nodes vcpu"
  type = number
  default = 1
}

variable "dataplane_count" {
  description = "The number of dataplane nodes"
  type = number
  default = 1
}

variable "dataplane_memory" {
  description = "The dataplane nodes memory"
  type = string
  default = "4096"
}

variable "dataplane_vcpu" {
  description = "The dataplane nodes vcpu"
  type = number
  default = 1
}

variable "kube_node_volume_path" {
  description = "The path for the location of the libvirt image volumes, AppArmour must either be configured for this location or disabled for libvirt"
  type = string
  default = "/var/lib/libvirt/images/volumes"
}

variable "root_pw" {
  description = "The node root password"
  type = string
  default = ""
  sensitive = true
}

variable "os_source" {
  description = "The location of the source cloud image, used with the cloud-init image to deploy the nodes"
  type = string
  default = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
}
