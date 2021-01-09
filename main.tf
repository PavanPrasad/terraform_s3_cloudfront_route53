provider "aws" {
	alias  = "prod"
	region = "us-west-2"
	access_key = "AKIAXFXVFGM5PRDSGBM6"
        secret_key = "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"
}

resource "aws_s3_bucket" "origin_pavan_me" {
  provider = "aws.prod"

  bucket = "origin.pavan.me"
  acl = "public-read"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
      "Principal": "*",
      "Action":"s3:GetObject",
      "Resource":["arn:aws:s3:::origin.pavan.me/*"
      ]
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
  }
}
