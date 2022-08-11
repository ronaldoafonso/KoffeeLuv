
variable "region" {
    description = "AWS region"
    type = string
}

variable "project" {
  description = "Project name"
  type = string
}

variable "environment" {
  description = "Project environment"
  type = string
}

variable "vpc" {
  description = "VPC configuration"
  type = map
}

variable "subnets" {
  description = "Subnets configuration"
  type = map
}
