resource "aws_lb_target_group" "TG" {
  vpc_id   = aws_vpc.terra_vpc.id
  name     = "LB-TG"
  port     = 80
  protocol = "HTTP"

  health_check {
    path = "/"
    port = 80
  }
}