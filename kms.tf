module "kms" {
  count = local.create_kms_key ? 1 : 0

  source  = "app.terraform.io/aedificans/Base-KMS-Key/aws"
  version = "1.0.1"

  naming              = var.naming
  environment         = var.environment
  description         = "A KMS Key for the ${local.naming.display} key-pair private key"
  enable_key_rotation = var.private_key_kms_key_rotation_enabled
  tagging             = var.tagging
}
