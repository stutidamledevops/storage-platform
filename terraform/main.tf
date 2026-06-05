resource "aws_s3_bucket" "storage_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.storage_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_iam_user" "storage_user" {
  name = var.iam_user_name

  tags = {
    ManagedBy = "Terraform"
  }
}
resource "aws_iam_policy" "s3_policy" {

  name = var.iam_policy_name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ListBucketAccess"
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = [
          aws_s3_bucket.storage_bucket.arn
        ]
      },
      {
        Sid    = "ObjectAccess"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = [
          "${aws_s3_bucket.storage_bucket.arn}/*"
        ]
      }
    ]
  })

  tags = {
    ManagedBy = "Terraform"
  }
}
resource "aws_iam_user_policy_attachment" "policy_attachment" {
  user       = aws_iam_user.storage_user.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
