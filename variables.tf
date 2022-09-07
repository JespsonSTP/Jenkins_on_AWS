variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}
variable "bucket" {
  description = "The project bucket for terraform backend"
  type        = string
}
variable "key" {
  description = "The project key for terraform backend"
  type        = string
}
variable "dynamodb_table" {
  description = "The project dynamodbt table for terraform backend"
  type        = string
}

variable "vpc_cidr" {
  type = string
  description = "the cidr for the vpc"
  default = "172.20.0.0/16"
}

variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  default     = null                                      
  type        = string
}
 
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "subnet_cidr" {
  type = list(string)
  description = "the cidrs for the vpc"
}
