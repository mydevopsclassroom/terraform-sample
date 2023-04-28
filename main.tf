# locals {
#   test = "main"
# }

module "network_skeleton" {
  source = "./network_skeleton/modules"
  cidr = var.vpc_cidr
  env = var.env
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  
}
