/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

resource "aws_service_discovery_private_dns_namespace" "service-discovery" {
  name        = "${var.apps_name}.pvt.local"
  description = "${var.apps_name} private dns namespace"
  vpc         = var.vpc_id
}