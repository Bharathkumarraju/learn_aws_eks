resource "aws_s3_bucket" "bharath_tf_state_store" {
  bucket = "bharaths-eu-terraform-remote-state"

  # Prevent Accidental Delete of this bucket
  lifecycle {
    prevent_destroy = true
  }

  # Enables versioning
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bharath_tf_state_store_sse" {
  bucket = aws_s3_bucket.bharath_tf_state_store.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "bharaths-terraform-locks" {
  hash_key = "LockID"
  name     = "bharaths-eu-terraform-remote-state-locks"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "bharath_s3_backend_arn" {
  value       = aws_s3_bucket.bharath_tf_state_store.arn
  description = "The S3 Bucket ARN"
}

output "bharath_dynamodb_table_name" {
  value       = aws_dynamodb_table.bharaths-terraform-locks.name
  description = "The Name of the DynamoDB table"
}
