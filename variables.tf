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

variable "public_cidrs" {
  type = list(string)
  description = "the public cidrs for the vpc"
}

variable "private_cidrs" {
  type = list(string)
  description = "the private cidrs for the vpc"
}

variable "aws_key_pair" {
    type = string
}

variable "my_ip" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "linux_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "linux_root_volume_size" {
  type        = number
  description = "Volumen size of root volumen of Linux Server"
}

variable "linux_data_volume_size" {
  type        = number
  description = "Volumen size of data volumen of Linux Server"
}

variable "linux_root_volume_type" {
  type        = string
  description = "Volumen type of root volumen of Linux Server. Can be standard, gp3, gp2, io1, sc1 or st1"
  default     = "gp2"
}

variable "linux_data_volume_type" {
  type        = string
  description = "Volumen type of data volumen of Linux Server. Can be standard, gp3, gp2, io1, sc1 or st1"
  default     = "gp2"
}