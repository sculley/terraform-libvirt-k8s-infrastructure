#cloud-config
groups:
  - cloud-users

users:
  - name: cloud-user
    primary_group: cloud-users
    sudo: ALL=(ALL) NOPASSWD:ALL
%{ if cloud_user_pw != "" }
    lock_passwd: false
    passwd: ${ cloud_user_pw }
%{ endif ~}
%{ if cloud_user_public_key != "" }
    ssh_authorized_keys: ${ cloud_user_public_key }
%{ endif ~}
ssh_pwauth: True
%{ if root_pw != "" }
chpasswd:
  list: |
    root:${ root_pw }
  expire: False


runcmd:
  - sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  - service sshd restart
%{ endif ~}

package_update: true
package_upgrade: true
packages:
  - python3
  - net-tools

final_message: "The system is finally up, after $UPTIME seconds"