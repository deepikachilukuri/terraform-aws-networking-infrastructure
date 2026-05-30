
resource "aws_subnet" "Deepika_Private_01" {
    vpc_id = aws_vpc.Deepika_vpc_01.id
    cidr_block = var.Private_Subnet_CIDR
    availability_zone = var.Private_Availability_Zone

    tags = {
      Name = "Deepika Terraform Private VPC 01"
    }
}