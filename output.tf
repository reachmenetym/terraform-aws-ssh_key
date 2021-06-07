output "ssh_key_name" {
    value = aws_key_pair.ssh_key_pair[0].key_name
}

output "ssh_private_key" {
    value = tls_private_key.private_key[0].private_key_pem
}

output "ssh_public_key" {
    value = aws_key_pair.ssh_key_pair[0].public_key
}