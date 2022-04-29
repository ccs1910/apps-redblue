/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

account_number              = 574461704747
region                      = "ap-southeast-1"
owner                       = "santosoc"
owner_email                 = "santosoc@amazon.com"
environment                 = "dev"
apps_name                   = "mytelkomsel"

cost_center                 = "cc-mytelkomsel"
downtime                    = "weekend-only"
patch_group                 = "rhel-non-prod"
maintenance_window          = "default"

vpc_id                      = "vpc-0991111a1acaad0f4"
private_subnet_cidr_1       = "10.0.2.0/25"
private_subnet_cidr_2       = "10.0.1.128/25"

public_subnet_id_1          = "subnet-082b4920bbf547760"
public_subnet_id_2          = "subnet-0ded652e0295b2993"

private_subnet_id_1         = "subnet-0a400c2c704a544e5"
private_subnet_id_2         = "subnet-0478e0436ad993b00"

database_subnet_id_1       = "subnet-0a72e41f2df4e4d37"
database_subnet_id_2       = "subnet-0d23965b059b6b57b"

outpost_private_subnet_id  = "subnet-0a400c2c704a544e5"