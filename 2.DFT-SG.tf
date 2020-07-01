#DFT-SG.tf 기본 시큐리티 그룹 생성

resource "aws_default_security_group" "ns08014-east-vpc_SG_DFT" {
    vpc_id= aws_vpc.ns08014-east-vpc.id
        ingress {
            protocol = -1
            self = true
            from_port = 0
            to_port = 0
            }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            }
    tags = {
        Name = "ns08014-esat-vpc_SG_DFT"
            }
        }
# 2번째 VPC용 SG 생성
