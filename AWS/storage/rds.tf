module "postgres_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = local.postgres_sg_name
  description = "DB securit group"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  # ingress with source sg
  ingress_with_source_security_group_id = [
    {
      description              = "Allow incoming traffic from EC2"
      from_port                = 5432
      to_port                  = 5432
      protocol                 = "tcp"
      source_security_group_id = data.terraform_remote_state.networking.outputs.default_security_group_id
    }

  ]
  
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = merge({ Name = "${local.postgres_sg_name}" }, local.common_tags)
}

 module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.2.0"

  identifier = local.rds_identifier

  engine               = "postgres"
  engine_version       = "14.3"
  major_engine_version = "14"
  instance_class       = var.rds_instance_type

  db_name                             = local.rds_db_name
  username                            = var.rds_db_username
  create_random_password              = false
  password                            = var.rds_db_password
  port                                = 5432
  iam_database_authentication_enabled = true

  multi_az               = var.rds_multi_az
  subnet_ids             = data.terraform_remote_state.networking.outputs.database_subnets
  vpc_security_group_ids = [module.postgres_sg.security_group_id]

  apply_immediately     = true
  storage_type          = var.rds_storage_type
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage
  storage_encrypted     = false
  #kms_key_id            = data.terraform_remote_state.account.outputs.e_d_key_arn

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  backup_retention_period = 30
  copy_tags_to_snapshot   = true
  deletion_protection     = true

  performance_insights_enabled = false

  publicly_accessible = false

  # monitoring_interval = 60

  # DB subnet group
  create_db_subnet_group = true

  # DB parameter group
  family = "postgres14"

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  db_instance_tags = merge({ Name = "${local.rds_identifier}" }, local.tags)
}