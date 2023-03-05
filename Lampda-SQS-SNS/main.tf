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


