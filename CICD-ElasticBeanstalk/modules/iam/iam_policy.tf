resource "aws_iam_policy" "deploy-policy" {
  name        = var.iam-policy-name
  path        = "/"
  description = "CICD Deploy IAM policy"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:*",
            "elasticbeanstalk:*",
            "ec2:*",
            "ecs:*",
            "ecr:*",
            "elasticloadbalancing:*",
            "autoscaling:*",
            "cloudwatch:*",
            "s3:*",
            "sns:*",
            "cloudformation:*",
            "dynamodb:*",
            "rds:*",
            "sqs:*",
            "logs:*",
            "events:*",
            "cloud9:*",
            "codecommit:*",
            "codebuild:*",
            "codepipeline:*",
            "codedeploy:*",
            "ssm:*",
            "es:*",
            "lambda:*",
            "tag:GetResources",
            "kms:ListKeyPolicies",
            "kms:GenerateRandom",
            "kms:ListRetirableGrants",
            "kms:GetKeyPolicy",
            "kms:ListResourceTags",
            "kms:ReEncryptFrom",
            "kms:ListGrants",
            "kms:GetParametersForImport",
            "kms:ListKeys",
            "kms:GetKeyRotationStatus",
            "kms:ListAliases",
            "kms:ReEncryptTo",
            "kms:DescribeKey"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
