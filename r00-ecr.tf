/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

resource "aws_kms_key" "ecr_kms" {
  description             = "KMS for ECR"
  enable_key_rotation     = true
}

resource "aws_ecr_repository" "ecr_blue" {
  name                 = "blue"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  encryption_configuration {
      encryption_type = "KMS"
      kms_key = aws_kms_key.ecr_kms.arn
  }
}

resource "aws_ecr_repository" "ecr_red" {
  name                 = "red"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  encryption_configuration {
      encryption_type = "KMS"
      kms_key = aws_kms_key.ecr_kms.arn
  }
}