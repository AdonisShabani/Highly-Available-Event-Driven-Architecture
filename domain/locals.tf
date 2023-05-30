locals {
  org                              = "AWS"
  domain_name                      = "adonisshabani.info"
  subject_alternative_names        = ["*.adonisshabani.info"]
  adonis_domain_name               = var.environment == "prod" ? "${local.domain_name}" : "${var.environment}.${local.domain_name}"
  


  common_tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}