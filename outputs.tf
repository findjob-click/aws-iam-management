output "iam_user_arn" {
  value       = aws_iam_user.my_user.arn
  description = "ARN of the created IAM user"
  condition   = false
}
