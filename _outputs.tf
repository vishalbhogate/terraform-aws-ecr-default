output "ecrarn" {
  value       = aws_ecr_repository.default.arn
  description = "Full ARN of the repository"
}