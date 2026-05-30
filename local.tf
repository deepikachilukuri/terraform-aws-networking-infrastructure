# Save private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.TLS_Key.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0400"
}