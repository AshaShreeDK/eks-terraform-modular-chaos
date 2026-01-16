locals {
  name = "${var.customer}-${var.env}"
}

/* VPC */

module "vpc" {
  source = "../../modules/vpc"

  name               = local.name
  cluster_name       = var.cluster_name
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

/* EKS */

module "eks" {
  source = "../../modules/eks"

  name                       = local.name
  cluster_name               = var.cluster_name
  region                     = var.region
  env                        = var.env
  customer                   = var.customer
  vpc_id                     = module.vpc.vpc_id
  public_subnet_ids           = module.vpc.public_subnet_ids
  private_subnet_ids          = module.vpc.private_subnet_ids
  cluster_security_group_id   = module.vpc.vpc_security_group_id
}

/* NODE GROUPS */

module "nodegroups" {
  source = "../../modules/nodegroups"

  name                = local.name
  cluster_name        = var.cluster_name
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  keypair             = var.keypair

  public_nodes_capacity = var.public_nodes_capacity
  public_nodes_type     = var.public_nodes_type
  public_nodes_min      = var.public_nodes_min
  public_nodes_max      = var.public_nodes_max
  public_nodes_des      = var.public_nodes_des
  public_nodes_labels   = var.public_nodes_labels

  private_nodes_capacity = var.private_nodes_capacity
  private_nodes_type     = var.private_nodes_type
  private_nodes_min      = var.private_nodes_min
  private_nodes_max      = var.private_nodes_max
  private_nodes_des      = var.private_nodes_des
  private_nodes_labels   = var.private_nodes_labels
  depends_on = [module.eks]

}
/* AUTOSCALER */

module "autoscaler" {
  source = "../../modules/autoscaler"

  cluster_name        = var.cluster_name
  region              = var.region
  oidc_provider_arn   = module.eks.oidc_provider_arn
  oidc_provider_url   = module.eks.cluster_oidc_issuer_url
}


