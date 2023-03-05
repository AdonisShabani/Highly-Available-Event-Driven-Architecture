# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.target-group.arn
#   target_id        = []
#   count            = 1
#   port             = 80
# }

resource "aws_lb_target_group" "target-group" {
  name     = "ALB-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

