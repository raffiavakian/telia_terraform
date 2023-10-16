variable "aws_region" {
 description = "AWS Region"
 type = string
 default = "eu-north-1"
}

variable "bucket_name" {
  description = "AWS Bucket Name"
  type = string
  default = "raffis-cv-bucket"
}

variable "key" {
  description = "key for s3 object"
  type = string
  default = "cvraffi.pdf"
}
variable "filepath" {
  description = "Path to file"
  type = string
  default = "/home/raffi/Desktop/Telia/cvraffi.pdf"
}