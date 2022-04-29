/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.apps_name}-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    
    endpoint_private_access = true
    public_access_cidrs = ["0.0.0.0/0"]
    subnet_ids = [var.public_subnet_id_1, var.public_subnet_id_2, var.private_subnet_id_1, var.private_subnet_id_2]

  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy,
  ]
}