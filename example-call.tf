module "my_multipass" {
  source           = "/modules/multipass"
  vm_name          = "cloud-vm"
  username        = "edmund"
  ssh_key         = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9wg8Ukv68PpQgG/fBEwALQDCr8hghn6oZfmLM5ed/T edmund@megatron.local"
  custom_packages  = ["htop", "git", "nginx"]
  runcmds          = ["echo Setup complete", "systemctl restart nginx"]
}
