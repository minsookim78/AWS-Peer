#IGW.tf : 인터넷게이트웨이 IGW 생성

resource "aws_internet_gateway" "ns08014-east-1-IGW" {
vpc_id = aws_vpc.ns08014-east-vpc.id
tags = {
Name = "ns08014-east-1-IGW"
}
}

#2번째 리전용 IGW생성
