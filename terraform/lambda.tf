data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "server" {
  name               = "dpr-sample-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = local.tags
}

data "aws_iam_policy" "lambda_basic_execution" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.server.name
  policy_arn = data.aws_iam_policy.lambda_basic_execution.arn
}

resource "aws_lambda_function" "server" {
  function_name    = "dpr-sample-lambda"
  runtime          = "provided.al2023"
  handler          = "main"
  role             = aws_iam_role.server.arn
  architectures    = ["arm64"]
  memory_size      = 128
  timeout          = 7
  package_type     = "Zip"
  filename         = "../lambda.zip"
  source_code_hash = filebase64sha256("../lambda.zip")
  tags             = local.tags
}
