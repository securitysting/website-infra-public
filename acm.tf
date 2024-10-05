resource "aws_acm_certificate" "secsting_cert" {
  domain_name               = "securitysting.com"
  subject_alternative_names = ["www.securitysting.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}