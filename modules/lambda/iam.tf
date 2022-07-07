data "aws_iam_policy_document" "iam_lambda_role_document" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_lambda_role" {
  name = "${var.prefix}-iam-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.iam_lambda_role_document.json
}

data "aws_iam_policy_document" "iam_invoke_lambda_policy_document" {
  statement {
    actions = ["lambda:InvokeFunction"]
    effect = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_invoke_lambda_policy" {
    name = "${var.prefix}-iam-invoke-lambda-policy"
    policy = data.aws_iam_policy_document.iam_invoke_lambda_policy_document.json
}