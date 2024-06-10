module "vpc" {
  source                = "./vpc-module"
  region                = var.region
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  db_subnet_cidr        = var.db_subnet_cidr
}
 
output "vpc_id" {
  value = module.vpc.vpc_id
}
 
output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}
 
output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}
 
output "db_subnet_id" {
  value = module.vpc.db_subnet_id
}
 
output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}