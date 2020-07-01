#Subnet.tf : 서브넷 생성

resource "aws_subnet" "ns08014-east-1-public_1a" { 
vpc_id = aws_vpc.ns08014-east-vpc.id
availability_zone = "us-east-1a"
cidr_block = "5.0.1.0/24"
tags = {
Name = "ns08014-east-1-public-1a"
}
}

resource "aws_subnet" "ns08014-east-1-public_1c" {
vpc_id = aws_vpc.ns08014-east-vpc.id
availability_zone = "us-east-1c"
cidr_block = "5.0.2.0/24"
tags = {
Name = "ns08014-east-1-public-1c"
}
}

