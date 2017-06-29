resource "aws_launch_configuration" "front" {
  name          = "front_config"
  image_id      = "${var.demo_ami}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  user_data  = "${file("shfile.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.demo_consumer.name}"
}




resource "aws_autoscaling_group" "front_autoscaling" {

  vpc_zone_identifier       = ["${var.front_subnets}"]
  name                      = "java-app"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.front.name}"
  enabled_metrics           = ["GroupTotalInstances"]


  tag {
    key                 = "Env"
    value               = "qa"
    propagate_at_launch = true
  }

  tag {
    key                 = "app"
    value               = "java-app"
    propagate_at_launch = false
  }
  tag {
    key                 = "layer"
    value               = "front"
    propagate_at_launch = false
  }
}
