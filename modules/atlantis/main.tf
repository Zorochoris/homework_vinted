resource "null_resource" "ansible_provisioner" {
  provisioner "local-exec" {
    command = "ansible-playbook -i '${var.public_ip},' ./ansible/install_atlantis.yml --extra-vars 'atlantis_port=${var.atlantis_port}'"
  }

  depends_on = [
    module.instance
  ]
}

output "atlantis_url" {
  value = "http://${var.public_ip}:${var.atlantis_port}"
}
