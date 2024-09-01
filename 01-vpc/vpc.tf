module "vpc" {
  source = "../../terraform-vpc-test"
  #source = "git::https://github.com/Nivas-art/terraform-vpc-test.git"
  common_tags = var.common_tags
  project_name = var.project_name
  environment = var.environment
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  accepter_vpc_id = var.accepter_vpc_id
  is_peering_required = var.is_peering_required
}
