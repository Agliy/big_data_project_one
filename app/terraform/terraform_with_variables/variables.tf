variable "region" {
  description = "阿里云区域"
  default     = "cn-shenzhen"
}

variable "max" {
  description = "随机数的最大值"
  default     = 99999
}

variable "min" {
    description = "随机数的最小值"
    default     = 10000
}
variable "bucket_prefix" {
    description = "OSS Bucket名称的前缀"
    default     = "example-value"
}

variable "acl" {
    description = "OSS Bucket的访问权限"
    default     = "private"
}