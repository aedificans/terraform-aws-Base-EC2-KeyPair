resource "aws_secretsmanager_secret" "this" {
  name                    = "${local.naming.resource}-private-key"
  kms_key_id              = coalesce(var.private_key_kms_arn, module.kms[0].arn)
  recovery_window_in_days = var.private_key_secret_recovery_window_in_days

  tags = merge(
    local.tags,
    tomap({ Name = "${local.naming.display} Private Key Secret" })
  )
}
resource "aws_secretsmanager_secret_version" "string" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = tls_private_key.this.private_key_pem
}
