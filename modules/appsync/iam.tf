data "aws_iam_policy_document" "iam_appsync_role_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["appsync.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_appsync_role" {
    name = "${var.prefix}-iam-appsync-role"
    assume_role_policy = data.aws_iam_policy_document.iam_appsync_role_document.json
}

resource "aws_iam_role_policy_attachment" "appsync_invoke_lambda" {
    role = aws_iam_role.iam_appsync_role.name
    policy_arn = aws_iam_policy.iam_invoke_lambda_policy.arn
}