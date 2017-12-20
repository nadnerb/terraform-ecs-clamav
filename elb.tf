resource "aws_security_group" "clamav-elb" {
  name = "${terraform.workspace}-${var.ecs_cluster_name}-clamav-elb-sg"
  description = "Clamav ELB Ports"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 3310
    to_port   = 3310
    protocol  = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${terraform.workspace}-${var.ecs_cluster_name}-clamav-elb-sg"
  }
}

resource "aws_elb" "clamav" {
  name = "${terraform.workspace}-${var.ecs_cluster_name}-clamav-elb"
  subnets = ["${split(",", var.subnet_ids)}"]

  listener {
    instance_port     = 3310
    instance_protocol = "tcp"
    lb_port           = 3310
    lb_protocol       = "tcp"
  }

  internal                  = true
  connection_draining       = false
  cross_zone_load_balancing = true
  security_groups           = ["${aws_security_group.clamav-elb.id}"]

  tags {
    Name = "${terraform.workspace}-${var.ecs_cluster_name}-clamav-elb"
  }
}

