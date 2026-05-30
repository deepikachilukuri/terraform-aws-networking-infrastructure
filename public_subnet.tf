resource "aws_subnet" "Deepika_Public_01" {
    vpc_id = aws_vpc.Deepika_vpc_01.id
    cidr_block = var.Public_Subnet_CIDR
    availability_zone = var.Public_Availability_Zone

    tags = {
      Name = "Deepika Terraform Public VPC 01"
    }
}