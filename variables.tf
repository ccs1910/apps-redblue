/*---------------------------------------------------------------------------------------
© 2022 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
 
This AWS Content is provided subject to the terms of the AWS Customer Agreement
available at http://aws.amazon.com/agreement or other written agreement between
Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
---------------------------------------------------------------------------------------*/

variable "account_number" {
  type        = number
  description = "12 digit of the target account number."
}

variable "region" {
  description = "default region"
  default     = "ap-southeast-3"
}

variable "environment" {
  description = "The application SDLC Environment."
  validation {
    condition = contains(
      ["prod", "nft", "pre-prod", "dev"], var.environment
    )
    error_message = "SDLC environment that you put is not in the list."
  }
}

variable "apps_name" {
  description = "Name of the application"
}

variable "owner" {
  description = "Owner of the application. Currently only used for tagging"
}

variable "owner_email" {
  description = "Email of application owner. Currently only used for tagging"
}

variable "cost_center" {
  description = "Application cost-center."
}

variable "downtime" {
  description = "Application Downtime period."
  validation {
    condition = contains(
      ["weekend-only", "never", "weekday-off-peak"], var.downtime
    )
    error_message = "Value that you put is not in the list."
  }
  default = "never"
}

variable "patch_group" {
  validation {
    condition = contains(
      ["windows-non-prod", "windows-prod", "rhel-non-prod", "rhel-prod", "amzlinux-non-prod", "amzlinux-prod"], var.patch_group
    )
    error_message = "Value that you put is not in the list."
  }
  description = "Resource Patch-group"
}

variable "maintenance_window" {
  description = "Resource maintenance window"
  default = "default"
}

variable "vpc_id" {
  description = "The VPC Id"
}

variable "private_subnet_cidr_1" {
  description = "Private Subnet CIDR 1"
}

variable "private_subnet_cidr_2" {
  description = "Private Subnet CIDR 2"
}

##### Subnet IDs ########

variable "public_subnet_id_1" {
  description = "Public Subnet ID 1"
}

variable "public_subnet_id_2" {
  description = "Public Subnet ID 2"
}

# Private Subnet IDs
variable "private_subnet_id_1" {
  description = "Private Subnet ID 1"
}

variable "private_subnet_id_2" {
  description = "Private Subnet ID 2"
}

# Database Subnet IDs
variable "database_subnet_id_1" {
  description = "Database Subnet ID 1"
}

variable "database_subnet_id_2" {
  description = "Database Subnet ID 2"
}


# Outpost Subnet IDs
variable "outpost_private_subnet_id" {
  description = "Subnet ID on Outpost"
}
