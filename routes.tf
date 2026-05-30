resource "aws_route_table" "Deepika_Private_RT_01" {
    vpc_id = aws_vpc.Deepika_vpc_01.id

    tags = {
      Name = "Deepika Private Terraform RT 01"
    }
}

resource "aws_default_route_table" "Deepika_Public_RT_01" {
    default_route_table_id = aws_vpc.Deepika_vpc_01.default_route_table_id
    
    route{
        cidr_block = var.Full_IPV4_CIDR
        gateway_id = aws_internet_gateway.Deepika_igw_01.id
    }
    tags = {
        Name = "Deepika Public Terraform RT 01"
    }
}

resource "aws_route_table_association" "Deepika_Private_RT_Assoc_01" {
    subnet_id = aws_subnet.Deepika_Private_01.id

    route_table_id = aws_route_table.Deepika_Private_RT_01.id
  
}