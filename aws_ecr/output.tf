output "mywebapp_ecr_repository_url" {
  value = aws_ecr_repository.mywebapp-repo.repository_url
}

output "mysql_ecr_repository_url" {
  value = aws_ecr_repository.mysql-repo.repository_url
}