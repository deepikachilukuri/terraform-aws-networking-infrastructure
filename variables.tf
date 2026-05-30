variable "Region" {
  type = string
  default = "us-east-1"
}

variable "VPC_CIDR" {
  type = string
  default = "172.16.0.0/16"
}

variable "Private_Subnet_CIDR" {
    type = string
    default = "172.16.128.0/17"
}

variable "Public_Subnet_CIDR" {
    type = string
    default = "172.16.0.0/17"
}

variable "Private_Availability_Zone" {
    type = string
    default = "us-east-1a"
}

variable "Public_Availability_Zone" {
    type = string
    default = "us-east-1a"
}

variable "Full_IPV4_CIDR" {
    type = string
    default = "0.0.0.0/0"
}