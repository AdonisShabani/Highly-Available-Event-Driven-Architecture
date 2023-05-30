resource "aws_route53_zone" "zone" {
  name = local.adonis_domain_name

  tags = merge({name = "${local.adonis_domain_name}"}, local.common_tags)

}

resource "aws_route53_record" "adonisshabani" {
  zone_id = aws_route53_zone.zone.id
  name    = local.domain_name
  type    = "A"
  alias {
    name                   = data.terraform_remote_state.compute.outputs.lb_dns_name
    zone_id                = data.terraform_remote_state.compute.outputs.lb_zone_id
    evaluate_target_health = true
  }
}