terraform {
  backend "s3" {
    bucket = "shailendra01"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
