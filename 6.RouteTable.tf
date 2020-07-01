#RouteTable.tf : 기본 라우팅 테이블 생성

# 1 리젼용 RT 생성
resource "aws_route_table" "rt-ns08014-east-1-public"{
    vpc_id= aws_vpc.ns08014-east-vpc.id
        route {
            cidr_block= "0.0.0.0/0"
            gateway_id= aws_internet_gateway.ns08014-east-1-IGW.id
              }
    tags = {
    Name = "rt-ns08014-east-1-public"
        }
}
# 1 리젼용 VPC RT에 서브넷 할당
resource "aws_route_table_association" "rt-ns08014-east-1_public_1a"{
subnet_id= aws_subnet.ns08014-east-1-public_1a.id
route_table_id=aws_route_table.rt-ns08014-east-1-public.id
}

resource "aws_route_table_association" "rt-ns08014-east-1_public_1c"{
subnet_id= aws_subnet.ns08014-east-1-public_1c.id
route_table_id= aws_route_table.rt-ns08014-east-1-public.id
}


# 2리젼용 RT 생성
