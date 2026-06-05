output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.storage_bucket.bucket
}

output "bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.storage_bucket.arn
}

output "iam_user_name" {
  description = "IAM User Name"
  value       = aws_iam_user.storage_user.name
}

output "policy_arn" {
  description = "IAM Policy ARN"
  value       = aws_iam_policy.s3_policy.arn
}