/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

########################################################
#1 Front End "Managed Node Group" in Region
########################################################
resource "aws_eks_node_group" "front_end_managed_ng" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.apps_name}-front-end-managed-ng-region"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.private_subnet_id_1, var.private_subnet_id_2] 

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
  ]
}

########################################################
#2 Front End "Self-Managed Node Group" in Outposts
########################################################
resource "aws_eks_node_group" "front_end_self_managed_ng" {
  count = (var.environment == "prod" || var.environment == "nft") ? 1 : 0
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.apps_name}-front-end-self-managed-ng-outpost"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.private_subnet_id_1, var.private_subnet_id_2]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
  ]
}

########################################################
#3 Back End "Managed Node Group" in Region
########################################################
resource "aws_eks_node_group" "back_end_managed_ng" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.apps_name}-back-end-managed-ng-region"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.private_subnet_id_1, var.private_subnet_id_2]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
  ]
}

########################################################
#4 Back End "Self-Managed Node Group" in Outposts
########################################################
resource "aws_eks_node_group" "back_end_self_managed_ng" {
  count = (var.environment == "prod" || var.environment == "nft") ? 1 : 0
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.apps_name}-back-end-self-managed-ng-outpost"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = [var.private_subnet_id_1, var.private_subnet_id_2]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
  ]
}