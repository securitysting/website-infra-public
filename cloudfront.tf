data "aws_cloudfront_cache_policy" "Managed-CachingOptimized" {
  name = "Managed-CachingOptimized"
}

data "aws_cloudfront_origin_request_policy" "CORS-S3Origin" {
  name = "Managed-CORS-S3Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket_website_configuration.website_config.website_endpoint
    origin_id                = "SecStingWebsiteS3Origin"
    custom_header {
      name  = "Referer"
      value = "customValue"
    }
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Security Sting CF"
  default_root_object = "index.html"

  aliases = ["securitysting.com", "www.securitysting.com"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "SecStingWebsiteS3Origin"

    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.CORS-S3Origin.id
    cache_policy_id          = data.aws_cloudfront_cache_policy.Managed-CachingOptimized.id
    compress                 = true
    viewer_protocol_policy   = "redirect-to-https"
    min_ttl                  = 0
    default_ttl              = 0
    max_ttl                  = 0

    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = aws_lambda_function.secsting_cloudfront_webserver.qualified_arn
      include_body = false
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.secsting_cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  price_class = "PriceClass_200"
}