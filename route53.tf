data "aws_route53_zone" "internal" {
  name         = "${terraform.workspace}.${var.zone_name}"
  private_zone = true
}

resource "aws_route53_record" "clamav" {
  zone_id = "${data.aws_route53_zone.internal.zone_id}"
  name    = "clamav.${data.aws_route53_zone.internal.name}"
  type    = "A"

  alias {
    name                   = "${aws_elb.clamav.dns_name}"
    zone_id                = "${aws_elb.clamav.zone_id}"
    evaluate_target_health = true
  }
}
