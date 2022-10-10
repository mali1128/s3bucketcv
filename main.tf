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

resource "aws_s3_bucket" "alicvwebsite" {
  bucket = "ali-cv-website"

}

resource "aws_s3_bucket_acl" "alicv_bucket_acl" {
  bucket = aws_s3_bucket.alicvwebsite.id
  acl    = "public-read"
}

resource "aws_s3_object" "website" {
  bucket = aws_s3_bucket.alicvwebsite.id
  source = "/index.html"
  key    = "website"
  }
