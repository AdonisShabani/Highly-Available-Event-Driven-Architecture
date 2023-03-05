resource "aws_sns_topic" "sns" {
  name = "My-topic"
}

# Define the SQS queue
resource "aws_sqs_queue" "sqs" {
  name = "My-queue"
}

# Subscribe the SQS queue to the SNS topic
resource "aws_sns_topic_subscription" "subsription" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs.arn
}

resource "aws_iam_role" "example" {
  name = "example-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_lambda_function" "example" {
  filename      = "function.zip"
  function_name = "Myfunction"
  role          = aws_iam_role.example.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
}


