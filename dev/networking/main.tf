
module "vpc" {
  source             = "../../Modules/"
  vpc_cidr           = var.vpc_cidr
  public_cidr_blocks = var.public_cidr_blocks
  default_tags       = var.default_tags
  env                = "dev"
  prefix             = var.prefix
}
