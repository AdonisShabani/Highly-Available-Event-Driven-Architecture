resource "aws_sns_topic" "sns" {
  name = local.aws_sns_topic
}

resource "aws_sqs_queue" "sqs" {
  name = local.aws_sqs_queue
}

resource "aws_sns_topic_subscription" "subsription" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs.arn
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.sqs.arn
      },
    ]
  })
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_lambda_function" "lambda" {
  filename      = "function.zip"
  function_name = "Myfunction"
  role          = aws_iam_role.test_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  tags = local.tags
}

resource "aws_lambda_event_source_mapping" "map" {
  event_source_arn = aws_sqs_queue.sqs.arn
  function_name    = aws_lambda_function.lambda.arn

  depends_on = [
    aws_iam_role_policy.test_policy
  ]
}


