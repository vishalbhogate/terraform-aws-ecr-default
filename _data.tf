data aws_caller_identity current {

}

data aws_iam_policy_document default {
  statement {
    sid    = "AllowPull"
    effect = "Allow"
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability"
    ]
    principals {
      type = "AWS"
      identifiers = [
        join(",", formatlist("arn:aws:iam::%s:root", var.trust_accounts))
      ]
    }
  }
  statement {
    sid    = "AllowWriteMgmt"
    effect = "Allow"
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]
    principals {
      type = "AWS"
      identifiers = [
        join(",", formatlist("arn:aws:iam::%s:root", var.trust_accounts))
      ]
    }
  }
}