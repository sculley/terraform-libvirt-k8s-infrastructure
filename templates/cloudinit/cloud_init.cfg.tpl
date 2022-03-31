#cloud-config
groups:
  - cloud-users

users:
  - name: cloud-user
    primary_group: cloud-users
    sudo: ALL=(ALL) NOPASSWD:ALL
%{ if passwd != "" }
    lock_passwd: false
    passwd: ${ passwd }
%{ endif ~}
    ssh_authorized_keys: ${ ssh_authorized_keys }

ssh_pwauth: True

package_update: true
package_upgrade: true
packages:
  - python3
  - net-tools

final_message: "The system is finally up, after $UPTIME seconds"