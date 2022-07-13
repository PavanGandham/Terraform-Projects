resource "aws_iam_policy_attachment" "deploy-policy-attach" {
	# checkov:skip=CKV_AWS_40: ADD REASON
  name = var.iam-policy-attach-name
  users = [ aws_iam_user.deploy-user.name ]
  policy_arn = aws_iam_policy.deploy-policy.arn
}