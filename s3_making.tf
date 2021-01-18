resource "aws_s3_bucket" "mybucket" {
  bucket = "s3terraformbucket"
  acl = "private"

  lifecycle_rule {
    enabled = true

    transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days = 60
      storage_class = "GLACIER"
    }
  }
}
