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