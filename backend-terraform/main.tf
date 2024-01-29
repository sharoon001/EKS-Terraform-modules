##################PROVIDER###########################
provider "aws" {
  region = var.region
}

#############S3 STATE BUCKET###########################
resource "aws_s3_bucket" "state-bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3-encrypt" {
  bucket = aws_s3_bucket.state-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.state-bucket.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}
#############DYNAMODB TABLE###########################
resource "aws_dynamodb_table" "state-lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key

  attribute {
    name = "LockID"
    type = "S"
  }
}    