provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_ecs_task_definition" "clamav" {
  family = "clamav"

  container_definitions = <<DEFINITION
[
  {
    "name": "clamav",
    "image": "dinkel/clamavd",
    "memoryReservation": 512,
    "memory": 1024,
    "cpu": 300,
    "portMappings": [
      {
        "hostPort": 3310,
        "containerPort": 3310
      }
    ]
  }
]
DEFINITION
}

data "aws_iam_role" "clamav" {
  name = "${var.iam_role}"
}

resource "aws_ecs_service" "clamav" {
  name          = "clamav"
  cluster       = "${var.ecs_cluster_id}"
  iam_role      = "${data.aws_iam_role.clamav.id}"

  desired_count                      = 2
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 50

  load_balancer {
    elb_name       = "${aws_elb.clamav.name}"
    container_name = "clamav"
    container_port = 3310
  }

  # Track the latest ACTIVE revision
  /* task_definition = "${aws_ecs_task_definition.clamav.family}:${max("${aws_ecs_task_definition.clamav.revision}", "${data.aws_ecs_task_definition.clamav.revision}")}" */

  task_definition = "${aws_ecs_task_definition.clamav.arn}"
}
