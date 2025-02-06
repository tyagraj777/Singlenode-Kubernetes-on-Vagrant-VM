output "vm_ssh" {
  value = "vagrant ssh ${vagrant_vm.k8s_vm.vm_name}"
}
