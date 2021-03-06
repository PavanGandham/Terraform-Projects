resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.regional_domain_name
    origin_id = "pavangandham"
  }
  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET","HEAD"]
    cached_methods = ["GET","HEAD"]
    target_origin_id = "pavangandham"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow_all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["US"]
    }
  }
  tags = {
    Environment = var.env
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}