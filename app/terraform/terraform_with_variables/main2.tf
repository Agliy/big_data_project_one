terraform {
  required_providers {
    alicloud = {
        source = "aliyun/alicloud"
        version = "~> 1.220"
    }
    random = {
        source = "hashicorp/random"
    }
  }
}

provider "alicloud" {
  region = var.region
}

resource "random_integer" "default" {
  max = var.max
  min = var.min
}

resource "alicloud_oss_bucket" "bucket-acl" {
  bucket = "${var.bucket_prefix}-${random_integer.default.result}"
}

resource "alicloud_oss_bucket_acl" "bucket-acl" {
  bucket = alicloud_oss_bucket.bucket-acl.bucket
  acl    = var.acl
}