
resource "tls_private_key" "Tf_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "Tf_key" {
  key_name = "Tf_key"
  public_key = tls_private_key.Tf_key.public_key_openssh
}

resource "local_file" "Tf_key" {
  content = tls_private_key.Tf_key.private_key_pem
  filename = "Tf_key"
}