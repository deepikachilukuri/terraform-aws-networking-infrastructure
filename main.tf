

resource "aws_security_group" "Deepika_Windows_SG_01" {
    name = "Widows Web SG"
    description = "Allows RDP(3389), HTTP(3000), HTTPS(443)"

    vpc_id = aws_vpc.Deepika_vpc_01.id

    # RDP
    ingress {
        description = "RDP Access"
        from_port   = 3389
        to_port     = 3389
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
    }

    # HTTP
    ingress {
        description = "HTTP Access"
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = [var.Full_IPV4_CIDR]
    }
    
    # HTTPS
    ingress {
        description = "HTTPS Access"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = [var.Full_IPV4_CIDR]
    }

    #OUTBOND
    egress {
        description = "Outbond Access"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.Full_IPV4_CIDR]
    }

    tags = {
        Name = "${random_pet.deepika_pet.id}-Windows SG" 
    }
}

resource "aws_security_group" "Deepika_Linux_SG_01" {
    name = "Linux SG"
    description = "Allows SSH(22), MySQL(3306)"
    vpc_id = aws_vpc.Deepika_vpc_01.id
    # SSH
    ingress {
        description = "Allows SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.VPC_CIDR]
    }

    # MySQL
    ingress {
        description = "Allows MySQL"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = [var.Full_IPV4_CIDR]
        }
    
    # OUTBOUND
    egress {
        description = "Outbound Access"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.Full_IPV4_CIDR]
    }
  
    tags = {
        Name = "${random_pet.deepika_pet.id}-Linux SG"
    }
}
resource "aws_instance" "Deepika_Windows_Web_Server_01" {
    subnet_id = aws_subnet.Deepika_Public_01.id
    
    ami = "ami-06d4892cdcf1d2cf7" # Windows Server 2025 Base
    instance_type = "t3.small"
    vpc_security_group_ids = [aws_security_group.Deepika_Windows_SG_01.id]
    key_name = aws_key_pair.Key_Pair.key_name
    get_password_data = true #enable retrieval of windows password
    tags = {
        Name = "${random_pet.deepika_pet.id}-Windows"
    }
  ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }
}

resource "aws_eip" "Deepika_Windows_Elastic_IP_01" {

    instance = aws_instance.Deepika_Windows_Web_Server_01.id
    domain = "vpc"

    tags = {
        Name = "${random_pet.deepika_pet.id}-Windows EIP"
    }
  
}
resource "aws_eip_association" "Deepika_Windows_Elastic_IP_Assoc_01" {
    instance_id = aws_instance.Deepika_Windows_Web_Server_01.id
    allocation_id = aws_eip.Deepika_Windows_Elastic_IP_01.id
  
}

resource "aws_instance" "Deepika_Linux_DB_01" {
    subnet_id = aws_subnet.Deepika_Private_01.id

    # Amazon Linux Server 2023 kernel-6.1 AMI
  ami = "ami-0236922087fa98b6e"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.Deepika_Linux_SG_01.id]
  key_name = aws_key_pair.Key_Pair.key_name

    tags = {
        Name = "${random_pet.deepika_pet.id}-Linux DB"
    }

}

resource "aws_default_network_acl" "Deepika_Default_Network_ACL_01" {
    default_network_acl_id = aws_vpc.Deepika_vpc_01.default_network_acl_id

    # Allows inbound traffic
    # Allow RDP
    ingress {
      rule_no = 100
      protocol = "tcp"
      action = "allow"
      cidr_block = var.Full_IPV4_CIDR
      from_port = 3389
      to_port = 3389
    }

    # Allow HTTP
    ingress {
      rule_no = 200
      protocol = "tcp"
      action = "allow"
      cidr_block = var.Full_IPV4_CIDR
      from_port = 3000
      to_port = 3000
    }

    # Allow HTTPS
    ingress {
        rule_no    = 300
        protocol   = "tcp"
        action     = "allow"
        cidr_block = var.Full_IPV4_CIDR
        from_port  = 443
        to_port    = 443
    }
  
    # SSH
    ingress {
        rule_no = 400
        protocol = "tcp"
        action = "allow"
        cidr_block = var.VPC_CIDR
        from_port = 22
        to_port = 22
    }
    
    # Allow MySQL
    ingress {
      rule_no = 500
      protocol = "tcp"
      action = "allow"
      cidr_block = var.Full_IPV4_CIDR
      from_port = 3306
      to_port = 3306
    }


    # Allow Dynamic Ports
    ingress {
      rule_no = 600
      protocol = "tcp"
      action = "allow"
      cidr_block = var.Full_IPV4_CIDR
      from_port = 32768
      to_port = 65535
    }

    # Allows Outbound Traffic
    egress {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = var.Full_IPV4_CIDR
        from_port  = 0
        to_port    = 0
    }
        subnet_ids = [ aws_subnet.Deepika_Public_01.id, aws_subnet.Deepika_Private_01.id ]

    tags = {
        Name = "${random_pet.deepika_pet.id}-NACL "
    }
}


#resource "aws_subnet" "Deepika_VPC_01" {
 #   vpc_id = aws_vpc.Deepika_vpc_01.id
  #  cidr_block = "172.16.0.0/17"
   # availability_zone = "us-east-1a"

    #tags = {
     # Name = "Deepika Terraform VPC 01"
    #}
#}

resource "aws_eip" "Deepika_NAT_EIP_01" {
    domain = "vpc"

    tags = {
        Name = "${random_pet.deepika_pet.id}-NAT EIP"
    }
  
}

resource "aws_nat_gateway" "Deepika_NAT_Gateway_01" {
    allocation_id = aws_eip.Deepika_NAT_EIP_01.id
    subnet_id = aws_subnet.Deepika_Public_01.id

    tags = {
        Name = "${random_pet.deepika_pet.id}-NAT"
    }
    
    depends_on = [ aws_internet_gateway.Deepika_igw_01 ]
}