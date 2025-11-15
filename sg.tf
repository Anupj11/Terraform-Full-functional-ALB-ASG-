resource "aws_security_group" "sg" {
  name        = "asg_security_group"
  vpc_id      = aws_vpc.terra_vpc.id
  description = "this is sg for LB and ASG"

  tags = {
    Name = "Terra-Sg"
  }

  ingress {
    description = "for SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "for HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "for outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}