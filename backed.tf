terraform {
  backend "s3" {
    bucket = "terrform-bucket-s3"
    key    = "env/prod"
    access_key = "AKIAT52UCTQEJSUPFBWD" // add your key here
    secret_key = "kaVdMMCWG2//c5Aj7eRT0qBEwHDG5GBJ9HVWYa1N" //// add your key here
    region = "us-east-1"
  }
}
