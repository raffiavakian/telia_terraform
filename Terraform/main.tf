resource "aws_s3_object" "cv_object" {
  bucket = var.bucket_name
  key    = var.key
  source = var.filepath
  depends_on = [aws_s3_bucket_policy.cv_bucket_policy]
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.cv_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket.cv_bucket]
}

resource "aws_s3_bucket_public_access_block" "block_acl_false" {
  bucket = "${aws_s3_bucket.cv_bucket.id}"

  block_public_acls   = false
  block_public_policy = false
}
resource "aws_s3_bucket_policy" "cv_bucket_policy" {
  bucket = aws_s3_bucket.cv_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/cvraffi.pdf"
    }
  ]
}
POLICY
depends_on = [aws_s3_bucket_ownership_controls.owner]
}

resource "aws_s3_object" "cv_object" {
  bucket = var.bucket_name
  key    = "cvraffi.pdf"
  source = "/home/raffi/Desktop/Telia/cvraffi.pdf"
  depends_on = [aws_s3_bucket_policy.cv_bucket_policy]
}

output "cv_url" {
  value = "https://${aws_s3_bucket.cv_bucket.bucket}.s3.amazonaws.com/${aws_s3_object.cv_object.key}"
}