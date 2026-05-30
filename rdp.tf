locals {
  deepika_rdp_content = <<-RDP_CONTENT
    auto connect:i:1
    full address:s:${aws_eip.Deepika_Windows_Elastic_IP_01.public_ip}
    username:s:Administrator
    audiomode:i:2
    audiocapturemode:i:1
    RDP_CONTENT
}

resource "local_file" "deepika_rdp_file" {
    content  = local.deepika_rdp_content
    #filename = "${var.rdp_file_name}.rdp"
    #filename = "deepika_web.rdp"
    filename = "tf-${formatdate("YYYYMMDDhhmmss", timestamp())}.rdp"
    depends_on = [aws_eip_association.Deepika_Windows_Elastic_IP_Assoc_01]

}

resource "null_resource" "rdp_execute" {

  triggers = {
    rdp_file = local_file.deepika_rdp_file.filename
  }

  provisioner "local-exec" {

    command = "open ${local_file.deepika_rdp_file.filename}"

    working_dir = path.module
  }
}