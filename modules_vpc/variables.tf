variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}
 
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
 
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
 
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}
 
variable "db_subnet_cidr" {
  description = "The CIDR block for the database subnet"
  type        = string
}