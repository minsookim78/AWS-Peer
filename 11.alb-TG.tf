
#alb-TG.tf :로드발란서 타겟그룹생성

resource "aws_alb_target_group" "ns08014-east-frontend80" {
name = "ns08014-east-frontend-TG80"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.ns08014-east-vpc.id
health_check {
interval = 30
path = "/"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}

resource "aws_alb_target_group" "ns08014-east-frontend8080" {
name = "ns08014-east-frontend-TG8080"
port = 8080
protocol = "HTTP"
vpc_id = aws_vpc.ns08014-east-vpc.id
health_check {
interval = 30
path = "/"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}

#resource "aws_alb_target_group_attachment" "frontend" {
#target_group_arn = "${aws_alb_target_group.ns08014-frontend.arn}"
#target_id = "${aws_instance.ns08014_ec2_1a.id}"
#port = 80
#}
#resource "aws_alb_target_group_attachment" "frontend_1c" {
#target_group_arn = "${aws_alb_target_group.ns08014-frontend.arn}"
#target_id = "${aws_instance.ns08014_EC2_1c.id}"
#port = 80
#}