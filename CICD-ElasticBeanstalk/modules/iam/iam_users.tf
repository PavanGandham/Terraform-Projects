resource "aws_iam_user" "deploy-user" {
  name = var.iam-user-name
  path = "/"
  tags = {
    Name = var.iam-user-name
  }
}