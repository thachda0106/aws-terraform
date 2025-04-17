# Output all security group names created with `count`
output "security_group_names" {
  description = "Names of the security groups created using count"
  value       = [for sg in aws_security_group.count_example : sg.name]
}

# Output all S3 bucket names created with `for_each`
output "s3_bucket_names" {
  description = "Names of the S3 buckets created using for_each"
  value       = [for bucket in aws_s3_bucket.foreach_example : bucket.bucket]
}
