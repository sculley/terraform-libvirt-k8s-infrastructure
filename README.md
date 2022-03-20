# terraform-libvirt-k8s-infrastructure

This Terraform module will provision the libvirt infrastructure for a kubernetes cluster (pool, volumes & domains)

# Example

```shell
module "kuberneters-nodes" {
    source = "github.com/sculley/terraform-libvirt-k8s-infrastructure"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.6.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.6.14 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.this](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.this_controlplane](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/domain) | resource |
| [libvirt_domain.this_dataplane](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/domain) | resource |
| [libvirt_pool.this](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/pool) | resource |
| [libvirt_volume.this_controlplane](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/volume) | resource |
| [libvirt_volume.this_dataplane](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.14/docs/resources/volume) | resource |
| [random_password.this_cloud_user](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.this_root_user](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [template_file.network_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_init_network_config"></a> [cloud\_init\_network\_config](#input\_cloud\_init\_network\_config) | The cloud-init network config used to build the common cloud-init image when creating nodes | `string` | `""` | no |
| <a name="input_cloud_init_user_data"></a> [cloud\_init\_user\_data](#input\_cloud\_init\_user\_data) | The cloud-init config used to build the common cloud-init image when creating nodes | `string` | `""` | no |
| <a name="input_cloud_user_public_key"></a> [cloud\_user\_public\_key](#input\_cloud\_user\_public\_key) | The public key for the cloud-user | `string` | `""` | no |
| <a name="input_cloud_user_pw"></a> [cloud\_user\_pw](#input\_cloud\_user\_pw) | The password for the cloud-user | `string` | `""` | no |
| <a name="input_controlplane_count"></a> [controlplane\_count](#input\_controlplane\_count) | The number of controlplane nodes | `number` | `1` | no |
| <a name="input_controlplane_mem"></a> [controlplane\_mem](#input\_controlplane\_mem) | The controlplane nodes memory | `string` | `"2560"` | no |
| <a name="input_controlplane_vcpu"></a> [controlplane\_vcpu](#input\_controlplane\_vcpu) | The controlplane nodes vcpu | `number` | `1` | no |
| <a name="input_dataplane_count"></a> [dataplane\_count](#input\_dataplane\_count) | The number of dataplane nodes | `number` | `1` | no |
| <a name="input_dataplane_memory"></a> [dataplane\_memory](#input\_dataplane\_memory) | The dataplane nodes memory | `string` | `"4096"` | no |
| <a name="input_dataplane_vcpu"></a> [dataplane\_vcpu](#input\_dataplane\_vcpu) | The dataplane nodes vcpu | `number` | `1` | no |
| <a name="input_kube_node_volume_path"></a> [kube\_node\_volume\_path](#input\_kube\_node\_volume\_path) | The path for the location of the libvirt image volumes, AppArmour must either be configured for this location or disabled for libvirt | `string` | `"/var/lib/libvirt/images/volumes"` | no |
| <a name="input_os_source"></a> [os\_source](#input\_os\_source) | The location of the source cloud image, used with the cloud-init image to deploy the nodes | `string` | `"https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"` | no |
| <a name="input_root_pw"></a> [root\_pw](#input\_root\_pw) | The node root password | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_controlplane_node_ips"></a> [controlplane\_node\_ips](#output\_controlplane\_node\_ips) | A list of ips for the controlplane nodes |
| <a name="output_dataplane_node_ips"></a> [dataplane\_node\_ips](#output\_dataplane\_node\_ips) | A list of ips for the dataplane nodes |