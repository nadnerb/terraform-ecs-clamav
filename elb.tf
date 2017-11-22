resource "aws_elb" "clamav" {
  name = "clamav-elb"
  /* we don't have default subnets */
  /* availability_zones = ["${split(",", var.availability_zones)}"] */
  subnets = ["${split(",", var.subnet_ids)}"]

  listener {
    instance_port     = 3310
    instance_protocol = "tcp"
    lb_port           = 3310
    lb_protocol       = "tcp"
  }

  /* health_check { */
  /*   healthy_threshold   = 2 */
  /*   unhealthy_threshold = 2 */
  /*   timeout             = 3 */
  /*   target              = "TCP:3310/" */
  /*   interval            = 30 */
  /* } */

  internal = true
  connection_draining = false
  cross_zone_load_balancing = true

  tags {
    Name = "clamav-elb"
  }
}

