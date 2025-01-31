terraform {
  backend "s3" {
    bucket = "shailendra01"
    key    = "webserver/terraform.tfstate"
    region = "us-east-1"
  }
}
