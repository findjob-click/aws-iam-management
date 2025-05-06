resource "aws_iam_user" "frontend_user" {
  name = "frontend-user"
  tags = {
    Purpose = "Terraform-managed user"
  }
}

resource "aws_iam_access_key" "frontend_user_key" {
  user = aws_iam_user.frontend_user.name
}

resource "aws_iam_user_policy" "frontend_user_policy" {
  name = "frontend-user-service-access"
  user = aws_iam_user.frontend_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*",
          "lambda:*",
          "apigateway:*",
          "cloudfront:*",
          "route53:*",
          "waf:*",
          "rds:*"
        ],
        Resource = "*"
      }
    ]
  })
}
