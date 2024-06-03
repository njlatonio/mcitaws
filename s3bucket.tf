resource "aws_s3_bucket" "bucket1" {
    count=2
    tags = {
        name="test-bucket-${count.index}"
        }
}
