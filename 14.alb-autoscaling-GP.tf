#alb-autoscaling-GP.tf


resource "aws_autoscaling_group" "ns08014-east-web80" {
  name = "${aws_launch_configuration.ns08014-east-web80.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = ["${aws_alb_target_group.ns08014-east-frontend80.arn}"]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = "${aws_launch_configuration.ns08014-east-web80.name}"
  ####  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]  아ㅐㄹ vpc_zone_identifier 와 중복

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
       "${aws_subnet.ns08014-east-1-public_1a.id}",
       "${aws_subnet.ns08014-east-1-public_1c.id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "east-web80-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "ns08014-east-asg-attachment80" {
  autoscaling_group_name = aws_autoscaling_group.ns08014-east-web80.id
  alb_target_group_arn   = aws_alb_target_group.ns08014-east-frontend80.arn
}


#8080 
resource "aws_autoscaling_group" "ns08014-east-web8080" {
  name = "${aws_launch_configuration.ns08014-east-web8080.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = ["${aws_alb_target_group.ns08014-east-frontend8080.arn}"]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = "${aws_launch_configuration.ns08014-east-web8080.name}"
  ####  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]  아ㅐㄹ vpc_zone_identifier 와 중복

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
       "${aws_subnet.ns08014-east-1-public_1a.id}",
       "${aws_subnet.ns08014-east-1-public_1c.id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "east-web8080-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "ns08014-east-asg-attachment8080" {
  autoscaling_group_name = aws_autoscaling_group.ns08014-east-web8080.id
  alb_target_group_arn   = aws_alb_target_group.ns08014-east-frontend8080.arn
}

