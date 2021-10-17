resource "aws_s3_bucket" "my-s3-bucket_terraform_pract1" {
    for_each = {
      dev10638 = "my-dapp-bucket"
      qa10638 = "my-qapp-bucket"
      stag10638 = "my-sapp-bucket"
      prod10638 = "my-papp-bucket"
    }

    bucket = "${each.key}-${each.value}"
    acl = "private"

    tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
    }
  
}