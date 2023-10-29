locals {
  create_kms_key = var.encrypt_private_key_secret && var.private_key_kms_arn == null
}
