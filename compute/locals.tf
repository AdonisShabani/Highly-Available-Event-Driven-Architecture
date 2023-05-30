locals {
  org                      = "AWS"
  lb_name = "application-load-balancer${var.environment}"
  launch_template = "My-launc-template${var.environment}"
  aws_autoscaling_group = "auto-scaling${var.environment}"

  tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}