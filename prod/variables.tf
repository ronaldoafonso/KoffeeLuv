
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

variable "nat_gateways" {
  description = "A map of NAT gateway and the region they are located."
  type        = map
}

variable "instances" {
  description = "EC2 Instances"
  type        = map
}

variable "security_groups" {
  description = "Security Groups"
  type        = map
}

variable "key_pairs" {
  description = "SSH key pairs"
  type        = map
}

variable "containers" {
  description = "Containers"
  type        = map
}

variable "cluster" {
  description = "ECS cluster"
  type        = map
}

variable "service" {
  description = "ECS service"
  type        = map
}

variable "task_definition" {
  description = "ECS Task Definition"
  type        = map
}
