resource "aws_eks_cluster" "main" {
  name     = "${var.name}-eks"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = data.aws_subnet_ids.eks.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.main-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.main-AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.name}-node-group"
  node_role_arn   = aws_iam_role.node-group.arn
  subnet_ids      = data.aws_subnet_ids.eks.ids

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 2
  }

  update_config {
    max_unavailable = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.main-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.main-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.main-AmazonEC2ContainerRegistryReadOnly,
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}
