resource "aws_cloudwatch_metric_alarm" "scale_out_alarm" {
  alarm_name                = "demoScaleOutAlarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "QueueCount"
  namespace                 = "Custom/Queue"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "20"
  alarm_description         = "This metric monitors Custom/Queue "
  insufficient_data_actions = []
  dimensions {
    Queue = "${var.queue_name}"
  }
 alarm_actions = ["${aws_autoscaling_policy.policy_out.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "scale_in_alarm" {
  alarm_name                = "demoScaleInAlarm"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "45"
  metric_name               = "QueueCount"
  namespace                 = "Custom/Queue"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "5"
  alarm_description         = "This metric monitors Custom/Queue "
  insufficient_data_actions = []
  dimensions {
    Queue = "${var.queue_name}"
  }
  alarm_actions = ["${aws_autoscaling_policy.policy_in.arn}"]

}

resource "aws_autoscaling_policy" "policy_out" {
  name                   = "autoscaling_policy_out"
  scaling_adjustment     = 50
  adjustment_type        = "PercentChangeInCapacity"
  cooldown               = 30
  autoscaling_group_name = "${aws_autoscaling_group.front_autoscaling.name}"
}

resource "aws_autoscaling_policy" "policy_in" {
  name                   = "autoscaling_policy_in"
  scaling_adjustment     = -20
  adjustment_type        = "PercentChangeInCapacity"
  cooldown               = 180
  autoscaling_group_name = "${aws_autoscaling_group.front_autoscaling.name}"
}
