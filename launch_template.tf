resource "aws_launch_template" "template" {

  name = "template-for-lb"

  image_id      = var.ami
  instance_type = "t2.micro"

  user_data = filebase64("${path.module}/userdata.sh")

    vpc_security_group_ids = [ 
        aws_security_group.sg.id
     ]

     network_interfaces {
       associate_public_ip_address = true
    
     }
}