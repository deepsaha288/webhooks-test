resource "s3_bucket_name" "test-bucket" {
    bucket = var.s3_bucket_name
    region = var.s3_bucket_region
    tags = {
        Name        = "TestBucket1"
        Environment = "dev"
    }

}
