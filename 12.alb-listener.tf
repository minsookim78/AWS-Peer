
#alb-listener.tf

resource "aws_alb_listener" "ns08014-east-http80" {
load_balancer_arn = "${aws_alb.ns08014-east-alb80.arn}"
port = "80"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.ns08014-east-frontend80.arn}"
type = "forward"
}
}

resource "aws_alb_listener" "ns08014-east-http8080" {
load_balancer_arn = "${aws_alb.ns08014-east-alb8080.arn}"
port = "8080"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.ns08014-east-frontend8080.arn}"
type = "forward"
}
}