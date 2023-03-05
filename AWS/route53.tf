# resource "aws_route53_zone" "hosted_zone" {
#   name = "adonisshabani.info"

#   lifecycle {
#     prevent_destroy = false
#   }
# }

data "aws_route53_zone" "hosted_zone" {
  private_zone = false
  zone_id      = "Z055730626EDU97HD80IC"
}


resource "aws_route53_record" "adonisshabani" {
  zone_id = data.aws_route53_zone.hosted_zone.id
  name    = local.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}