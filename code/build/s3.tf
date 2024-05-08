provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "b619e051-b317-4600-9562-9c878f415d61"
    git_commit           = "ecb67642168fc54c15302750447d7a1799e8cae7"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-05-08 16:26:54"
    git_last_modified_by = "tmprender+dso-ws-may24@gmail.com"
    git_modifiers        = "tmprender+dso-ws-may24"
    git_org              = "dso-ws-may24"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

