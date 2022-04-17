variable "cloud_init_network_config" {
  description = "The cloud-init network config used to build the common cloud-init image when creating dataplane nodes"
  type = string
  default = ""
}

variable "cloud_init_user_data" {
  description = "The cloud-init config used to build the common cloud-init image when creating dataplane nodes"
  type = string
}

variable "node_count" {
  description = "The number of dataplane nodes"
  type = number
  default = 1
}

variable "memory" {
  description = "The dataplane nodes memory"
  type = string
  default = "2048"
}

variable "vcpu" {
  description = "The dataplane nodes vcpu"
  type = number
  default = 1
}

variable "os_source" {
  description = "The location of the source cloud image, used with the cloud-init image to deploy the dataplane nodes"
  type = string
  default = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
}

variable "pool" {
  description = "The storage pool where the dataplane volumes will be created"
  type = string
}

variable "size" {
  description = "The size in bytes of the dataplane volume (must be in 1073741824 bytes not 10MB, 10GB) Defaults to 10GB (in bytes)."
  type = string
  default = "10737418240"
}