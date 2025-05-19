variable "s3_bucket_name" {
    description = "The name of the S3 bucket to create."
    type        = string
        default     = "test-buckets"
}
variable "s3_bucket_region" {
    description = "The AWS region where the S3 bucket will be created."
    type        = string
    default     = "us-east-1"
}
variable "aws_access_key" {
    description = "The AWS access key."
    type        = string
    default     = "your_access_key"
}
variable "aws_secret_key" {
    description = "The AWS secret key."
    type        = string
    default     = "your_secret_key"
}