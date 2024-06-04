resource "aws_s3_bucket" "bucket1" {
    count=2
    tags = {
        name="test-bucket-${count.index}"
        }
}

#To disable S3 versioning
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Disabled"
  }
}

#Create 5 buckets and disable versioning for all
resource "aws_s3_bucket" "bucket_test" {
    count=5
    tags = {
        name="tst-bucket-${count.index}"
        }
}

resource "aws_s3_bucket_versioning" "versioning_example_test" {
  count = length(aws_s3_bucket.bucket_test.count)
  bucket = aws_s3_bucket.bucket_test.id[count.index]
  versioning_configuration {
    status = "Disabled"
  }
}

