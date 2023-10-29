output "key_name" {
  value       = aws_key_pair.this.key_name
  description = "The Name attribute of the key-pair"
}
output "key_arn" {
  value       = aws_key_pair.this.arn
  description = "The ARN of the key-pair"
}
output "private_key" {
  value       = tls_private_key.this.private_key_pem
  description = "The private key of the key-pair"
  sensitive   = true
}
output "public_key" {
  value       = tls_private_key.this.public_key_openssh
  description = "The public key of the key-pair"
}
output "secret_name" {
  value       = aws_secretsmanager_secret.this.name
  description = "The Name attribute of the private key's secret"
}
output "secret_arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = "The ARN of the private key's secret"
}
output "kms_key_arn" {
  value       = local.create_kms_key ? module.kms[0].arn : null
  description = "The ARN of the KMS Key"
}
output "kms_key_id" {
  value       = local.create_kms_key ? module.kms[0].id : null
  description = "The ID of the KMS Key"
}
output "kms_key_alias" {
  value       = local.create_kms_key ? module.kms[0].alias : null
  description = "The KMS Alias for the KMS Key"
}
output "kms_key_encrypt_policy_arn" {
  value       = local.create_kms_key ? module.kms[0].encrypt_policy_arn : null
  description = "The ARN of a policy that allows encryption access to the KMS Key"
}
output "kms_key_decrypt_policy_arn" {
  value       = local.create_kms_key ? module.kms[0].decrypt_policy_arn : null
  description = "The ARN of a policy that allows decryption access to the KMS Key"
}
output "kms_key_bicrypt_policy_arn" {
  value       = local.create_kms_key ? module.kms[0].bicrypt_policy_arn : null
  description = "The ARN of a policy that allows encryption and decryption access to the KMS Key"
}
output "kms_key_full_access_policy_arn" {
  value       = local.create_kms_key ? module.kms[0].full_access_policy_arn : null
  description = "The ARN of a policy that allows full access to the KMS Key"
}
