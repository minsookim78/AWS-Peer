#autoscale-alb.tf
resource "aws_alb" "ns08014-east-alb80" {
    name = "ns08014-east-alb80"
    internal = false
    security_groups = ["${aws_security_group.ns08014-east-alb-SG.id}"]
    subnets = [
       "${aws_subnet.ns08014-east-1-public_1a.id}",
       "${aws_subnet.ns08014-east-1-public_1c.id}"
    ]
    access_logs {
         bucket = "${aws_s3_bucket.ns08014s3.id}"
        #bucket = "aws_s3_bucket.ns08014s3.id"
        prefix = "frontend-alb"
        enabled = true
    }
    tags = {
        Name = "ns08014-east-alb-autoscaling80"
    }
    lifecycle { create_before_destroy = true }
}

resource "aws_alb" "ns08014-east-alb8080" {
    name = "ns08014-east-alb-autoscaling8080"
    internal = false
    security_groups = ["${aws_security_group.ns08014-east-alb-SG.id}"]
    subnets = [
       "${aws_subnet.ns08014-east-1-public_1a.id}",
       "${aws_subnet.ns08014-east-1-public_1c.id}"
    ]
    access_logs {
        bucket = "${aws_s3_bucket.ns08014s3.id}"
        prefix = "frontend-alb"
        enabled = true
    }
    tags = {
        Name = "ns08014-east-alb-autoscaling80"
    }
    lifecycle { create_before_destroy = true }
}