resource "aws_iam_role" "SecSting-Lambda-WebServer-Execution-Role" {
  name        = "secsting-lambda-webserver-execution-role"
  description = "Used by Lambda web server to create log groups"

  assume_role_policy = file("${path.module}/policies/Lambda-WebServer-Trust-Policy.json")
}

resource "aws_iam_policy" "SecSting-Lambda-WebServer-Execution-Policy" {
  name        = "secsting-lambda-webserver-execution-policy"
  description = "Used by Lambda web server to create log groups"

  policy = file("${path.module}/policies/Lambda-CreateLogs-Policy.json")
}