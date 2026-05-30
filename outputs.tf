output "my_public_ip" {
  value = chomp(data.http.myip.response_body)
}

output "key_name" {
  value = aws_key_pair.Key_Pair.key_name
}

output "windows_encrypted_pwd" {
    value = aws_instance.Deepika_Windows_Web_Server_01.password_data
    sensitive = false  
}

output "reachable" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.path_found
}

output "status" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.status
}

output "network_path_id" { 
    value = aws_ec2_network_insights_path.home_to_ec2.id
}

output "explanation" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.explanations
}

output "network_insights_path_info" {
  description = "Details of the Network Insights Path from home to EC2"
  value = {
    path_id        = aws_ec2_network_insights_path.home_to_ec2.id
    source         = aws_ec2_network_insights_path.home_to_ec2.source
    destination    = aws_ec2_network_insights_path.home_to_ec2.destination
    protocol       = aws_ec2_network_insights_path.home_to_ec2.protocol
    destination_port = aws_ec2_network_insights_path.home_to_ec2.destination_port
  }
}

output "linux_instance_id" {
    value = aws_instance.Deepika_Linux_DB_01.id
}

output "linux_instance_private_ip" {
    value = aws_instance.Deepika_Linux_DB_01.private_ip
}

output "windows_instance_id" {
    value = aws_instance.Deepika_Windows_Web_Server_01.id
}

output "windows_instance_private_ip" {
    value = aws_instance.Deepika_Windows_Web_Server_01.private_ip
}

output "windows_instance_public_ip" {
    value = aws_instance.Deepika_Windows_Web_Server_01.public_ip
}

output "NAT_public_IP" {
    value = aws_eip.Deepika_NAT_EIP_01.public_ip
}

output "NAT_private_IP" {
    value = aws_eip.Deepika_NAT_EIP_01.private_ip
}

output "random_pet_name" {
    value = random_pet.deepika_pet.id
}

output "random_id_base64_std" {
    value = random_id.deepika_id.b64_std
}

output "random_id_base64_url" {
    value = random_id.deepika_id.b64_url
}

output "random_id_hex" {
    value = random_id.deepika_id.hex
}

output "random_id_dec" {
    value = random_id.deepika_id.dec
}

output "random_id_bytes" {
    value = random_id.deepika_id.byte_length
}

output "random_id_keepers" {
    value = random_id.deepika_id.keepers
}

output "random_id_prefix" {
    value = random_id.deepika_id.prefix
}

output "random_integer" {
    value = random_integer.deepika_integer.result
}

output "random_integer_min" {
    value = random_integer.deepika_integer.min
}

output "random_integer_max" {
    value = random_integer.deepika_integer.max
}

output "random_integer_result" {
    value = random_integer.deepika_integer.result
}

output "random_integer_seed" {
    value = random_integer.deepika_integer.seed
}

output "random_integer_keepers" {
    value = random_integer.deepika_integer.keepers
}

output "random_string" {
    value = random_string.deepika_string.result
}