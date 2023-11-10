# Key-Pair

This module provisions an EC2 Key-Pair

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | app.terraform.io/aedificans/Base-KMS-Key/aws | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.string](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encrypt_private_key_secret"></a> [encrypt\_private\_key\_secret](#input\_encrypt\_private\_key\_secret) | Specifies whether or not to encrypt the secret that stores the private key | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | A naming object for the environment to provide both the environment's name and abbrevation for tagging and reporting purposes | <pre>object({<br>    name         = string<br>    abbreviation = string<br>  })</pre> | n/a | yes |
| <a name="input_naming"></a> [naming](#input\_naming) | A naming object to provide the display name of the service from the service catalog, and optionally also a resource name | <pre>object({<br>    display  = string<br>    resource = optional(string, null)<br>  })</pre> | n/a | yes |
| <a name="input_private_key_kms_arn"></a> [private\_key\_kms\_arn](#input\_private\_key\_kms\_arn) | A KMS Key ARN for use in encrypting the secret that stores the private key | `string` | `null` | no |
| <a name="input_private_key_kms_key_rotation_enabled"></a> [private\_key\_kms\_key\_rotation\_enabled](#input\_private\_key\_kms\_key\_rotation\_enabled) | Enable rotation of KMS key leveraged in encrypting the SecretsManager secret which contains the private key | `bool` | `true` | no |
| <a name="input_private_key_secret_recovery_window_in_days"></a> [private\_key\_secret\_recovery\_window\_in\_days](#input\_private\_key\_secret\_recovery\_window\_in\_days) | The number of days to retain the SecretsManager secret which contains the private key | `number` | `0` | no |
| <a name="input_tagging"></a> [tagging](#input\_tagging) | A collection of tags as key-value pairs to be applied to all applicable provisioned resources | <pre>object({<br>    additional_tags = optional(map(any), {})<br>    network         = string<br>    organization    = string<br>    owner           = string<br>    service_name    = optional(string, null)<br>    service_pattern = string<br>    tag_key_prefix  = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The ARN of the key-pair |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | The Name attribute of the key-pair |
| <a name="output_kms_key_alias"></a> [kms\_key\_alias](#output\_kms\_key\_alias) | The KMS Alias for the KMS Key |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the KMS Key |
| <a name="output_kms_key_bicrypt_policy_arn"></a> [kms\_key\_bicrypt\_policy\_arn](#output\_kms\_key\_bicrypt\_policy\_arn) | The ARN of a policy that allows encryption and decryption access to the KMS Key |
| <a name="output_kms_key_decrypt_policy_arn"></a> [kms\_key\_decrypt\_policy\_arn](#output\_kms\_key\_decrypt\_policy\_arn) | The ARN of a policy that allows decryption access to the KMS Key |
| <a name="output_kms_key_encrypt_policy_arn"></a> [kms\_key\_encrypt\_policy\_arn](#output\_kms\_key\_encrypt\_policy\_arn) | The ARN of a policy that allows encryption access to the KMS Key |
| <a name="output_kms_key_full_access_policy_arn"></a> [kms\_key\_full\_access\_policy\_arn](#output\_kms\_key\_full\_access\_policy\_arn) | The ARN of a policy that allows full access to the KMS Key |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The ID of the KMS Key |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | The private key of the key-pair |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | The public key of the key-pair |
| <a name="output_secret_arn"></a> [secret\_arn](#output\_secret\_arn) | The ARN of the private key's secret |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | The Name attribute of the private key's secret |
<!-- END_TF_DOCS -->
