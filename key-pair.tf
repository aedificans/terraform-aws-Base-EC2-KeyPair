resource "tls_private_key" "this" {
  algorithm = "RSA"
}
resource "aws_key_pair" "this" {
  key_name   = local.naming.resource
  public_key = tls_private_key.this.public_key_openssh

  tags = merge(
    local.tags,
    tomap({ Name = "${local.naming.display} Key-Pair" })
  )

  depends_on = [
    tls_private_key.this,
    module.kms
  ]

  lifecycle {
    ignore_changes = [
      key_name,
    ]
  }
}
