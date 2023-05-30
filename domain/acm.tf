module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = local.adonis_domain_name
  zone_id     = aws_route53_zone.zone.id

  subject_alternative_names = local.subject_alternative_names

  wait_for_validation = true

  tags = local.common_tags
}
