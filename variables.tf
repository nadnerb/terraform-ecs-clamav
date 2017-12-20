variable "aws_profile" {
  description = "The AWS profile to use (e.g can be found in /home/user/.aws/credentials)."
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

variable "desired_container_count" {
  description = "The desired number of containers."
  default = 2
}

variable "vpc_id" {
  description = "The vpc id required for security groups."
}

variable "subnet_ids" {
  description = "The subnet ids required for ELB placement."
}

variable "cidr_blocks" {
  description = "The cidr blocks for security groups."
}
