# Generate private/public key
resource "tls_private_key" "TLS_Key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "Key_Pair" {
  key_name   = "terraform-key"
  public_key = tls_private_key.TLS_Key.public_key_openssh
}