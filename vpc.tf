resource "aws_vpc" "Deepika_vpc_01" {
    cidr_block = var.VPC_CIDR

    tags = {
      Name = "Deepika Terraform VPC"
    }
  
}