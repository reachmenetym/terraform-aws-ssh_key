resource "tls_private_key" "private_key" {
  count = var.provision_ssh_key == "true" ? 1:0
  algorithm = "RSA"
  rsa_bits  = 2048
  # provisioner "local-exec" {
  #   command = "echo ${self.private_key_pem} >> ${var.key_name}.pem"
  #   #command = "echo test >> out.txt"
  # }
}


resource "aws_key_pair" "ssh_key_pair" {
  count = var.provision_ssh_key == "true" ? 1:0
  key_name   = var.key_name
  public_key = tls_private_key.private_key[0].public_key_openssh
}


resource "local_file" "store_ssh_key" {
  count = var.provision_ssh_key == "true" ? 1:0
    content     = tls_private_key.private_key[0].private_key_pem
    # filename = "${path.module}/foo.bar"
    filename = "./${var.key_name}.pem"
}