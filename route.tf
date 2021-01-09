resource "aws_route53_zone" "pavan_me" {
  provider = "aws.prod"
  name = "pavan.me"
}

resource "aws_route53_record" "origin" {
  provider = "aws.prod"
  zone_id = "${aws_route53_zone.pavan_me.zone_id}"
  name = "origin.pavan.me"
  type = "A"

  alias {
    name = "${aws_s3_bucket.origin_pavan_me.website_domain}"
    zone_id = "${aws_s3_bucket.origin_pavan_me.hosted_zone_id}"
    evaluate_target_health = false
  }
}
