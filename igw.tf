resource "aws_internet_gateway" "Deepika_igw_01" {
    vpc_id = aws_vpc.Deepika_vpc_01.id

    tags = {
      Name = "Deepika Terraform VPC 01"
    }
}