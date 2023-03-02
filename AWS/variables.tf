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
  default = "ami-0c0933ae5caf0f5f9"
  
}

variable "instance_type" {
  description = "Type of the EC2 Instaces"
  default = "t2.micro"
  
}

variable "key_name" {
  description = "Key pair for EC2"
  default = "Adonis-key"
  
}




variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string

  }))
  default = {
    "public-subent-1a" = {
      availability_zone = "eu-central-1a"
      cidr_block        = "10.0.1.0/24"
    }
    "public-subent-1b" = {
      availability_zone = "eu-central-1b"
      cidr_block        = "10.0.2.0/24"
    }
    "private-subent-1a" = {
      availability_zone = "eu-central-1a"
      cidr_block        = "10.0.3.0/24"
    }
    "private-subent-1b" = {
      availability_zone = "eu-central-1b"
      cidr_block        = "10.0.4.0/24"
      tags = {
        Name = "private-subent-1b"
      }

    }
  }

}