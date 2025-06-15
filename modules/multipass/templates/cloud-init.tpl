#cloud-config
package_update: true
users:
  - name: ${user_name}
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_key}
packages:
%{ for pkg in custom_packages ~}
  - ${pkg}
%{ endfor }

runcmd:
%{ for cmd in runcmds ~}
  - ${cmd}
%{ endfor }
