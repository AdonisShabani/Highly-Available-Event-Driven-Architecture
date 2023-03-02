resource "aws_security_group" "security-group" {

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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
  name = "My-template"

  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.security-group.id]

  user_data = filebase64("../user-data-az.sh")
}

resource "aws_autoscaling_group" "autoscaling" {
  name = "My-launc-template"
  availability_zones = ["eu-central-1a","eu-central-1b"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2

  launch_template {
    id      = aws_launch_template.ec2-template.id
    version = "$Latest"
  }
}