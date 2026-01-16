/* IAM Role for Node Groups */

resource "aws_iam_role" "nodes" {
  name = "${var.name}-eks-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

/* Attach Policies */

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
resource "aws_launch_template" "eks_nodes" {
  name_prefix = "${var.name}-eks-node-"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name}-eks-node"
    }
  }
}

/* Private Node Group */

resource "aws_eks_node_group" "private_nodes" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.name}-private-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = var.private_subnet_ids

  #remote_access {
  # ec2_ssh_key = var.keypair
  #}
  launch_template {
    id      = aws_launch_template.eks_nodes.id
    version = "$Latest"
  }

  scaling_config {
    desired_size = var.private_nodes_des
    max_size     = var.private_nodes_max
    min_size     = var.private_nodes_min
  }

  capacity_type = var.private_nodes_capacity

  tags = {
    Name = "${var.name}-private-node"
  }


}

/* Public Node Group */

resource "aws_eks_node_group" "public_nodes" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.name}-public-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = var.public_subnet_ids

  # remote_access {
  # ec2_ssh_key = var.keypair
  # }
  launch_template {
    id      = aws_launch_template.eks_nodes.id
    version = "$Latest"
  }

  scaling_config {
    desired_size = var.public_nodes_des
    max_size     = var.public_nodes_max
    min_size     = var.public_nodes_min
  }

  capacity_type = var.public_nodes_capacity

  tags = {
    Name = "${var.name}-public-node"
  }

}


