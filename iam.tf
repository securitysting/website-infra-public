resource "aws_iam_role" "SecSting-Lambda-WebServer-Role" {
  name        = "test-role"
  description = "Used by Lambda web server to create log groups"

  assume_role_policy = file("${path.module}/policies/Lambda-WebServer-Trust-Policy.json")
}

resource "aws_iam_policy" "SecSting-Lambda-WebServer-Policy" {
  name        = "test-policy"
  description = "Used by Lambda web server to create log groups"

  policy = file("${path.module}/policies/Lambda-CreateLogs-Policy.json")
}

resource "aws_iam_role_policy_attachment" "SecSting-Lambda-WebServer-Role_SecSting-Lambda-WebServer-Policy" {
  role       = aws_iam_role.SecSting-Lambda-WebServer-Role.name
  policy_arn = aws_iam_policy.SecSting-Lambda-WebServer-Policy.arn
}