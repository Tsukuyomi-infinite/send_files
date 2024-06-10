variable "region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}
 
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
default = "10.0.0.0/16"
}
 
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
default = "10.0.1.0/24"
}
 
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
default = "10.0.2.0/24"
}
 
variable "db_subnet_cidr" {
  description = "The CIDR block for the database subnet"
default = "10.0.3.0/24"
}