variable "aws_access_key" {
  description = "The AWS access key."
}

variable "aws_secret_key" {
  description = "The AWS secret key."
}

variable "region" {
  description = "The AWS region to create resources in."
  default = "ap-southeast-2"
}

variable "iam_role" {
  description = "IAM role with ecs privilages."
}

variable "zone_name" {
  description = "The rout53 internal zone name."
}

variable "ecs_cluster_id" {
  description = "The id (arn) of the Amazon ECS cluster."
}

variable "ecs_cluster_name" {
  description = "The name of the Amazon ECS cluster."
}

variable "subnet_ids" {
  description = "The subnet ids required for ELB placement."
}
