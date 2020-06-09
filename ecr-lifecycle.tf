resource aws_ecr_lifecycle_policy default {
  count      = var.required_ecr_lifecyle ? 1 : 0
  repository = aws_ecr_repository.default.name
  policy     = <<EOF
{
    "rules": [
       { 
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "countUnit": "days",
                "countType": "sinceImagePushed",
                "countNumber": 14,
                "tagStatus": "untagged"
            },
            "action": {
                "type": "expire"
            }
       },
       {
           "rulePriority": 2,
           "description": "Expire images with feature tag",
           "selection": 
           {
               "countType": "imageCountMoreThan",
               "tagPrefixList": [
                    "feature",
                    "prod",
                    "deploy",
                    "qa"
               ],
               "countNumber": 1,
               "tagStatus": "tagged"
           },
           "action": {
               "type": "expire"
           }
       },
       {
           "rulePriority": 3,
           "description": "Expire images with the same tag",
           "selection": {
               "countType": "imageCountMoreThan",
               "countNumber": 1,
               "tagStatus": "any"
           },
           "action": {
               "type": "expire"
           }
       }
    ]
}
EOF
}
