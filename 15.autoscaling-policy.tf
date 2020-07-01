#autoscaling-policy.tf

#UP
resource "aws_autoscaling_policy" "ns08014-east-web_policy_up80" {
  name = "ns08014-east-web_policy_up80"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 10
  autoscaling_group_name = "${aws_autoscaling_group.ns08014-east-web80.name}"
}

resource "aws_cloudwatch_metric_alarm" "user05-esat-web_cpu_alarm_up80" {
  alarm_name = "ns08014-east-web_cpu_alarm_up80"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "20"

  #dimensions {
  #  AutoScalingGroupName = "${aws_autoscaling_group.web.name}"
  #}

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = ["${aws_autoscaling_policy.ns08014-east-web_policy_up80.arn}"]
}

#Down
resource "aws_autoscaling_policy" "ns08014-east-web_policy_down80" {
  name = "ns08014-east-web_policy_down80"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 10
  autoscaling_group_name = "${aws_autoscaling_group.ns08014-east-web80.name}"
}

resource "aws_cloudwatch_metric_alarm" "ns08014-east-web_cpu_alarm_down80" {
  alarm_name = "ns08014-east-web_cpu_alarm_down80"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "10"

  #dimensions {
  #  AutoScalingGroupName = "${aws_autoscaling_group.east-web.name}"
  #:}

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = ["${aws_autoscaling_policy.ns08014-east-web_policy_down80.arn}"]
}

#080

#UP
resource "aws_autoscaling_policy" "ns08014-east-web_policy_up8080" {
  name = "ns08014-east-web_policy_up8080"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 10
  autoscaling_group_name = "${aws_autoscaling_group.ns08014-east-web8080.name}"
}

resource "aws_cloudwatch_metric_alarm" "ns08014-east-web_cpu_alarm_up8080" {
  alarm_name = "ns08014-east-web_cpu_alarm_up8080"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "20"

  #dimensions {
  #  AutoScalingGroupName = "${aws_autoscaling_group.web.name}"
  #}

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = ["${aws_autoscaling_policy.ns08014-east-web_policy_up8080.arn}"]
}

#Down
resource "aws_autoscaling_policy" "ns08014-east-web_policy_down8080" {
  name = "ns08014-east-web_policy_down8080"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 10
  autoscaling_group_name = "${aws_autoscaling_group.ns08014-east-web8080.name}"
}

resource "aws_cloudwatch_metric_alarm" "ns08014-east-web_cpu_alarm_down8080" {
  alarm_name = "ns08014-east-web_cpu_alarm_down8080"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "10"

  #dimensions {
  #  AutoScalingGroupName = "${aws_autoscaling_group.east-web.name}"
  #:}

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = ["${aws_autoscaling_policy.ns08014-east-web_policy_down8080.arn}"]
}
