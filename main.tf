terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cvwebsitemali" {
  bucket = "cvwebsite-mali"

}

resource "aws_s3_bucket_acl" "alicv_bucket_acl" {
  bucket = aws_s3_bucket.cvwebsitemali.id
  acl    = "public-read"
}

resource "aws_s3_object" "website" {
  bucket = aws_s3_bucket.cvwebsitemali.id
  source = "/home/ec2-user/environment/s3bucketcv/index.html"
  key    = "website1"
  }

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.cvwebsitemali.bucket

  index_document {
    suffix = "index.html"
  }