# resource "aws_acm_certificate" "cert" {
#   domain_name               = local.domain_name
#   subject_alternative_names = local.subject_alternative_names
#   validation_method         = "DNS"



#   lifecycle {
#     create_before_destroy = true
#   }
# }


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = local.domain_name
  zone_id     = data.aws_route53_zone.hosted_zone.id

  subject_alternative_names = local.subject_alternative_names

  wait_for_validation = true

  tags = {
    Name = "adonisshabani.info"
  }
}
