resource "local_file" "encrypt_pwd" {
    filename = "encrypted_password.txt"
    content = aws_instance.Deepika_Windows_Web_Server_01.password_data
    
    provisioner "local-exec" {
    command = "echo ${local_file.encrypt_pwd.content}| base64 -d | openssl rsautl -decrypt -inkey ./terraform-key.pem -out decrypt_password.txt"
    }
}
