variable "region" {
  description = "specify region"
  type        = string
}
variable "bucket_name" {
  description = "bucket name"
  type        = string
}
variable "bucket_versioning" {
  description = "bucket versioning 'Enable' and 'Disable' "
  type        = string
}
variable "dynamodb_table_name" {
  description = "dynamodb table name"
  type        = string
}
variable "hash_key" {
  description = "hash key"
  type        = string
}