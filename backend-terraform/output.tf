output "bucket_name" {
  value = aws_s3_bucket.state-bucket.bucket

}
output "dynamodb_table_name" {
  value = aws_dynamodb_table.state-lock.name
}