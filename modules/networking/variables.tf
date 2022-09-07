variable "namespace" {
    type = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "vpc_cidr" {
  type = string
  description = "the cidr for the vpc"
  default = "172.20.0.0/16"
}

variable "subnet_cidr" {
  type = list(string)
  description = "the cidrs for the vpc"
}