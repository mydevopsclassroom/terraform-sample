terraform {
  backend "s3" {
    bucket = "terrform-bucket-s3"
    key    = "env/prod"
    region = "us-east-1"
  }
}
