resource "aws_cloudfront_distribution" "pavan_distribution" {
  provider = "aws.prod"
  origin {
    domain_name = "origin.pavan.me.s3.amazonaws.com"
    origin_id = "pavan_origin"
    s3_origin_config {}
  }
  enabled = true
  default_root_object = "index.html"
  aliases = ["pavan.me", "www.pavan.me"]
  price_class = "PriceClass_200"
  retain_on_delete = true
  default_cache_behavior {
    allowed_methods = [ "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "pavan_origin"
    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
