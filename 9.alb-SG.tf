#alb-SG.tf :어플리케이션 로드발란서용 시큐리티 그룹 생성
# 1번 리젼용
resource "aws_security_group" "ns08014-east-alb-SG" {
    name = "ns08014-esat-alb-SG"
    description = "open HTTP port for ALB"
    vpc_id = aws_vpc.ns08014-east-vpc.id
    
        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                }
        ingress {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                }
        ingress {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                 }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
                }
    tags = {
        Name = "ns08014-east-alb-SG"
            }
}

#2번 리젼용
