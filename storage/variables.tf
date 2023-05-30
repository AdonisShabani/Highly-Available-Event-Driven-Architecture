variable "region" {
  type        = string
  description = "region"
  default     = "eu-central-1"
}

variable "access_key" {
  type        = string
  description = "Aws Access Key"
}

variable "secret_key" {
  type        = string
  description = "Aws Secret Access Key"
}


variable "AWS_SESSION_TOKEN" {
  type        = string
  description = "Aws Session Token"
}

variable "environment" {
    type = string
    default = "dev"
  
}
# RDS Variables

variable "rds_instance_type" {
  description = "Instance type of RDS Instance"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_db_username" {
  description = "Username of postgres db"
  type        = string
  default     = "root"
}

variable "rds_db_password" {
  description = "Password of the postgres db"
  type        = string
  default     = null
}

variable "rds_storage_type" {
  description = "Name of storage class type"
  default     = "gp2"
}

variable "rds_allocated_storage" {
  description = "The size of allocated storage"
  type        = string
  default     = 20
}

variable "rds_max_allocated_storage" {
  description = "The maximum size of allocated storage"
  type        = string
  default     = 30
}
variable "rds_multi_az" {
  description = "Whether to deploy rds in multi az or single az"
  type        = bool
  default     = false
}