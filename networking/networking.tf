module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = local.vpc_name
  cidr = var.cidr

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  map_public_ip_on_launch = false

  manage_default_route_table    = true
  default_route_table_name      = local.default_route_table_name
  manage_default_network_acl    = true
  default_network_acl_name      = local.default_network_acl_name
  manage_default_security_group = true
  default_security_group_name   = local.default_security_group_name
  enable_dns_hostnames          = true
  enable_dns_support            = true
  enable_nat_gateway            = true

  create_database_subnet_group       = false
  create_database_subnet_route_table = true
  create_database_nat_gateway_route  = true

  # Cloudwatch log group and IAM role will be created
  enable_flow_log                                 = true
  create_flow_log_cloudwatch_log_group            = true
  flow_log_cloudwatch_log_group_name_suffix       = local.flow_log_cloudwatch_log_group_name_suffix
  flow_log_cloudwatch_log_group_retention_in_days = var.environment == "prod" ? 90 : 30
  create_flow_log_cloudwatch_iam_role             = true

  public_subnet_tags   = local.public_subnet_tags
  private_subnet_tags  = local.private_subnet_tags
  database_subnet_tags = local.database_subnet_tags
  tags                 = local.tags
}
