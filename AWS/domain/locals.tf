locals {
  org                      = "AWS"
  domain_name = "adonisshabani.info"
  subject_alternative_names = ["*.adonisshabani.info"]
  adonis_domain_name        = var.environment == "prod" ? "${local.domain_name}" : "${var.environment}.${local.volvo_domain}"
  adonis_subject_alternative_names = var.environment == "prod" ? "${local.subject_alternative_names}" : "${var.environment}.${local.subject_alternative_names}"

  

  tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}