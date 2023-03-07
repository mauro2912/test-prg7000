resource "aws_ssm_parameter" "cw-agent" {
  description = "Cloudwatch agent configuration to custom logs"
  name        = "/cloudwatch-agent/config"
  type        = "SecureString"
  value       = file("cw-agent_config.json")
}