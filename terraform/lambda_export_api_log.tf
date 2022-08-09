resource "aws_lambda_function" "aws_lambda_export_api_log" {
  function_name    = "aws_lambda_export_api_log"
  filename         = "dists.zip"
  source_code_hash = filebase64sha256("dists.zip")
  runtime          = "python3.8"
  role             = aws_iam_role.worker-role.arn
  handler          = "lambda_export_api_log.handler"
}