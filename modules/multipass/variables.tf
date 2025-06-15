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

variable "package_list" {
  default = [
    "curl",
    "git",
    "htop",
    "vim",
    "build-essential"
  ]
}
variable "runcmds" {
  default = [
    "echo 'Hello, Multipass!' > /home/ubuntu/hello.txt",
    "sudo apt-get update",
    "sudo apt-get install -y nginx"
  ]
} 