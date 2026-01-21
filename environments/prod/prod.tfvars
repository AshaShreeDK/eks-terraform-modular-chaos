region       = "us-east-1"
customer     = "dlr"
env          = "prod"
cluster_name = "EKS-PROD"

vpc_cidr           = "10.40.0.0/16"
public_subnets     = ["10.40.10.0/24", "10.40.15.0/24"]
private_subnets    = ["10.40.20.0/24", "10.40.25.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

keypair = "asha.nvrg"

public_nodes_capacity = "ON_DEMAND"
public_nodes_type     = "t2.medium"
public_nodes_min      = 2
public_nodes_max      = 4
public_nodes_des      = 2
public_nodes_labels   = { env = "public" }

private_nodes_capacity = "ON_DEMAND"
private_nodes_type     = "t2.small"
private_nodes_min      = 1
private_nodes_max      = 3
private_nodes_des      = 1
private_nodes_labels   = { env = "private" }

