locals {
  org                      = "AWS"
  
  rds_db_name = "Adonis-db-${var.enviroment}"
  rds_identifier = "Adonis-postgres-${var.environment}"
  postgres_sg_name = "Adonis-sg-${var.environment}"
  

  tags = {
    Project     = local.org
    Environment = var.environment
    Managed_by  = "Terraform"
    Owner       = "Adonis"
    Region      = var.region
  }
}