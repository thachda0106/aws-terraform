provider "aws" {
  region = var.AWS_REGION
}

resource "aws_s3_bucket" "s3-test-bucket-1600" {
  bucket = var.AWS_BUCKET

  tags = {
    Name        = var.AWS_BUCKET
    Environment = var.APP_ENV
  }
}