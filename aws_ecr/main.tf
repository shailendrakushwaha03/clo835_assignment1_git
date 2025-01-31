provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "mywebapp-repo" {
  name                 = "webapp-assignment1"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "mysql-repo" {
  name                 = "mysql-assignment1"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
 