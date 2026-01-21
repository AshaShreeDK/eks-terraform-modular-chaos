region       = "us-east-1"
customer     = "dlr"
env          = "preprod"
cluster_name = "EKS-PREPROD"

vpc_cidr           = "10.30.0.0/16"
public_subnets     = ["10.30.10.0/24", "10.30.15.0/24"]
private_subnets    = ["10.30.20.0/24", "10.30.25.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

keypair = "asha.nvrg"

public_nodes_capacity = "ON_DEMAND"
public_nodes_type     = "t2.medium"
public_nodes_min      = 1
public_nodes_max      = 2
public_nodes_des      = 1
public_nodes_labels   = { env = "public" }

private_nodes_capacity = "ON_DEMAND"
private_nodes_type     = "t2.small"
private_nodes_min      = 0
private_nodes_max      = 1
private_nodes_des      = 1
private_nodes_labels   = { env = "private" }

