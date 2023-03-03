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

variable "ami_id" {
  description = "Ami ID used for EC2 Instaces"
  default     = "ami-0c0933ae5caf0f5f9"

}

variable "instance_type" {
  description = "Type of the EC2 Instaces"
  default     = "t2.micro"

}

variable "key_name" {
  description = "Key pair for EC2"
  default     = "Adonis-key"

}

variable "availability_zone" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]

}

variable "db-username" {
  type        = string
  description = "Username of the database"
}

variable "db-password" {
  type        = string
  description = "Password of the database"
}


