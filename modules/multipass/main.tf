locals {
  cloud_init_rendered = templatefile("${path.module}/templates/cloud-init.yaml.tmpl", {
    custom_packages = var.custom_packages
    runcmds         = var.runcmds
  })
}

# Optionally write to file to inspect
resource "local_file" "cloud_init" {
  content  = local.cloud_init_rendered
  filename = "${path.module}/cloud-init.yaml"
}

resource "null_resource" "multipass_vm" {
  triggers = {
    vm_name     = var.vm_name
    cloud_init  = sha1(local.cloud_init_rendered)
  }

  provisioner "local-exec" {
    command = <<EOT
      multipass launch --name ${self.triggers.vm_name} --mem 2G --cpus 2 --disk 10G --cloud-init ${local_file.cloud_init.filename}
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = "multipass delete --purge ${self.triggers.vm_name}"
  }
}
