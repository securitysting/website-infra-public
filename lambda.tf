resource "aws_lambda_function" "secsting_cloudfront_webserver" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${path.module}/src/index1.js.zip"
  function_name = "secsting_cloudfront_webserver"
  role          = aws_iam_role.SecSting-Lambda-WebServer-Role.arn
  handler       = "index.handler"

  runtime = "nodejs20.x"
  publish = true
  timeout = 5
}