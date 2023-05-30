locals {
  org                              = "AWS"
  aws_sns_topic = "my-topic-${var.environment}"
  aws_sqs_queue = "my-queue-${var.environment}"


  common_tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}