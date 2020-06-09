variable "name" {
  description = "Name for ECR repository"
}

variable "trust_accounts" {
  type        = list(string)
  description = "Accounts to trust and allow ECR fetch"
}

variable "required_ecr_lifecyle" {
  default     = false
  description = "true/false ECR repository lifecycle policy"
}
