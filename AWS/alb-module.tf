# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 8.0"

#   name = "My-ALB1"

#   load_balancer_type = "application"

#   vpc_id          = aws_vpc.vpc.id
#   subnets         = [aws_subnet.public-subnets[0].id, aws_subnet.public-subnets[1].id]
#   count           = 1
#   # security_groups = ["aws_security_group.security-group"]
#   security_group_name = "My-security-gorup"
#   target_groups = [
#     {
#       name_prefix      = "TG"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#     }
#   ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = module.acm.acm_certificate_arn
#       target_group_index = 0
#     }
#   ]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]

#   tags = {
#     Environment = "Dev"
#   }
# }