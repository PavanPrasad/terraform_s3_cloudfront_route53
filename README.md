# terraform_s3_cloudfront_route53
#Create a project folder
#Create a file main.tf with the aws environment variables
terraform init
#Add rules in main.tf to setup an S3 bucket to act as your ‘origin’. This is where all your static HTML files and assets will live
terraform apply
#Add a Route53 Record for your Origin in route.tf file
terraform validate
terraform apply
#Setup your CloudFront Distribution rules in file cloudfront.tf, since we dont have a valid website the terraform apply will throw error
#Once we have a valid domain, this setup works fine.
#I have test in my bucket with URL http://origin.pavan.me.s3-website-us-west-2.amazonaws.com/
