resource "aws_s3_bucket" "secsting-website" {
  bucket = "secsting-website"
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.secsting-website.id
  policy = templatefile("${path.module}/policies/S3-Website-Bucket-Policy.json.tftpl", {
    cloudfront_arn = aws_cloudfront_distribution.s3_distribution.arn
  })
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.secsting-website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}