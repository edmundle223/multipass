variable "vm_name" {
  default = "terraform-vm"
}

variable "memory" {
  default = "4G"
}

variable "cpus" {
  default = 2
}

variable "cloud_init_file" {
  default = "cloud-init.yaml"
}

resource "null_resource" "multipass_vm" {
  triggers = {
    vm_name = var.vm_name
  }

  provisioner "local-exec" {
    command = <<EOT
      multipass launch \
        --name ${self.triggers.vm_name} \
        --mem ${var.memory} \
        --cpus ${var.cpus} \
        --cloud-init ${var.cloud_init_file}
    EOT
  }
  provisioner "local-exec" {
    when    = destroy
    command = "multipass delete --purge ${self.triggers.vm_name}"
  }
}

