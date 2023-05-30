module "adonis_hosted_zone" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "${local.adonis_domain_name}" = {
      comment = "Public hosted zone for ${local.adonis_domain_name}"
      tags = {
        Name = "${local.adonis_domain_name}"
      }
    }
  }

  tags = local.tags
}