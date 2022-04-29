/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

#currently Terraform has not support ap-southeast-3
# Issue: https://github.com/hashicorp/terraform-provider-aws/issues/22252

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

      version = ">= 3.5, != 3.14.0, < 4.0"
    }
    template = {
      source = "hashicorp/template"
    }
    time = {
      source = "hashicorp/time"
    }
  }

  backend "s3" {
    # Replace this with your bucket name!
    bucket                 = "santosoc-tsel-terraform-apse3" #"<Your Bucket Name>"
    key                    = "terraform-states/mytelkomsel/terraform.tfstate"
    region                 = "ap-southeast-3" #"<Your Region>"
    skip_region_validation = true
    # Not mandatory
    profile = "santosoc-tsel-cgk" #"<Your AWS Profile>"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "santosoc-tsel-terraform-ddb" #"<Your Dynamo DB>"
    encrypt        = true
  }

  required_version = ">= 0.13"
}

# Configure the AWS Provider
provider "aws" {
  region                 = "ap-southeast-1" #"<Your Region>"
  skip_region_validation = true
  # Not mandatory
  profile = "santosoc-tsel-cgk" #"<Your AWS Profile>"
  default_tags {
    tags = {
      Created_by      = "TerraformManaged"
      OwnerTeam       = var.owner
      OwnerTeamEmail  = var.owner_email
      Environment     = var.environment
      ApplicationName = var.apps_name
      CostCenter      = var.cost_center
      Downtime        = var.downtime
      PatchGroup      = var.patch_group
      MaintenanceWindow = var.maintenance_window
    }
  }
}