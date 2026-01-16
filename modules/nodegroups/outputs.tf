output "node_role_arn" {
  value = aws_iam_role.nodes.arn
}

output "private_nodegroup_name" {
  value = aws_eks_node_group.private_nodes.node_group_name
}

output "public_nodegroup_name" {
  value = aws_eks_node_group.public_nodes.node_group_name
}

