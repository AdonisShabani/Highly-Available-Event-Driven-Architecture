locals {
  org                                       = "AWS"
  vpc_name                                  = format("%s-vpc-%s", local.org, var.environment)
  default_route_table_name                  = format("%s-default-rt-%s", local.org, var.environment)
  default_network_acl_name                  = format("%s-default-acl-%s", local.org, var.environment)
  default_security_group_name               = format("%s-default-sg-%s", local.org, var.environment)
  flow_log_cloudwatch_log_group_name_suffix = format("%s/%s", local.org, var.environment)

  vpc_tags = merge(tomap({
    "Name" = "${local.vpc_name}"
  }), local.tags)

  private_subnet_tags = merge(tomap({
    "Tier"                                              = "Private"
  }), local.tags)

  public_subnet_tags = merge(tomap({
    "Tier"                                              = "Public"
  }), local.tags)

  database_subnet_tags = merge(tomap({
    "Tier" = "DB"
  }), local.tags)

  tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}