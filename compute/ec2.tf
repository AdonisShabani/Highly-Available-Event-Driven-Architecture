resource "aws_security_group" "security-group" {

  vpc_id = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "HTTP-SSH-rule"
  }
}

resource "aws_launch_template" "ec2-template" {
  name = local.launch_template

  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name



  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.security-group.id]
  }

  user_data = filebase64("./user-data.sh")
}

resource "aws_autoscaling_group" "autoscaling" {
  name                = local.launch_template
  vpc_zone_identifier = [data.terraform_remote_state.networking.outputs.public_subnets]
  count               = 1
  desired_capacity    = 3
  max_size            = 3
  min_size            = 3
  target_group_arns   = [aws_lb_target_group.target-group.arn]
  launch_template {
    id      = aws_launch_template.ec2-template.id
    version = "$Latest"
  }
}


