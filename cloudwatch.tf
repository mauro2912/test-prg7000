#/* resource "aws_cloudwatch_dashboard" "monitor-ec2-challenge1" {
#  dashboard_name = "EC2-dashboard-challenge1"
#
#  dashboard_body = <<EOF
#{
#    "widgets": [
#        {
#            "type": "metric",
#            "x": 0,
#            "y": 0,
#            "width": 10,
#            "height": 9,
#            "properties": {
#                "view": "timeSeries",
#                "stacked": false,
#                "metrics": [
#                    [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-058cc47877f1597b0" ],
#                    [ ".", "NetworkIn", ".", "." ],
#                    [ ".", "NetworkOut", ".", "." ],
#                    [ ".", "CPUUtilization", ".", "i-0f32cecfef079e6ea" ]
##                ],
##                "region": "us-east-1"
##            }
##        }
##    ]
##}
##    EOF
##} */
#
##resource "aws_cloudwatch_log_group" "logsGroup-challenge1" {
#  name              = "application_logs"
#  retention_in_days = 1
#  kms_key_id = aws_kms_key.kms-key-challenge1
#
#  tags = {
#    Environment = "learning"
#    Application = "Terraform challenges"
#  }
#}
#
#resource "aws_cloudwatch_log_stream" "syslog" {
#  name           = "Syslog"
#  log_group_name = aws_cloudwatch_log_group.logsGroup-challenge1.name
#}
#
#resource "aws_cloudwatch_log_stream" "cloudwatchlogs" {
#  name           = "Cloudwatch"
#  log_group_name = aws_cloudwatch_log_group.logsGroup-challenge1.name
#}
