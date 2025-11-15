resource "aws_autoscaling_group" "asg" {
  name = "terra-autoscalling"


  min_size         = 1
  desired_capacity = 1
  max_size         = 3

  vpc_zone_identifier = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]

    
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
 
  }

  target_group_arns = [aws_lb_target_group.TG.arn]

  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_attachment" "attachments" {

    autoscaling_group_name = aws_autoscaling_group.asg.name
    lb_target_group_arn = aws_lb_target_group.TG.arn
    
  
}