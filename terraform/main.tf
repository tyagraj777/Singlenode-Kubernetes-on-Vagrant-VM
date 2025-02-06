provider "vagrant" {}

resource "vagrant_vm" "k8s_vm" {
  box = "ubuntu/focal64" # Lightweight Ubuntu 20.04
  vm_name = "k8s-vm"
  memory = 2048 # 2GB RAM
  cpus = 2

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y curl",
      "curl -fsSL https://raw.githubusercontent.com/your-username/single-node-k8s/main/scripts/install_kubernetes.sh | bash"
    ]
  }

  provisioner "file" {
    source      = "~/.kube/config"
    destination = "/home/vagrant/.kube/config"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chown vagrant:vagrant /home/vagrant/.kube/config"
    ]
  }
}

output "vm_ssh" {
  value = "vagrant ssh ${vagrant_vm.k8s_vm.vm_name}"
}
