<!-- BEGIN_TF_DOCS -->
# New Relic AWS RDS Event Integration Terraform module
This Terraform module constructs and configures the necessary resources for integrating AWS RDS Event into New Relic.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.32.1 |

## Resources

| Name | Type |
|------|------|
| [aws_db_event_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_event_subscription) | resource |
| [aws_iam_policy.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_s3_bucket.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_versioning.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_license_key"></a> [newrelic\_license\_key](#input\_newrelic\_license\_key) | This is your New Relic ingest license key, and it is needed for Kinesis Firehose to successfully send logs to your New Relic account. | `string` | n/a | yes |
| <a name="input_newrelic_collector_endpoint"></a> [newrelic\_collector\_endpoint](#input\_newrelic\_collector\_endpoint) | This is the New Relic collector endpoint. The URL changes based on your account region (US/EU), and can be found on https://docs.newrelic.com/jp/docs/logs/forward-logs/stream-logs-using-kinesis-data-firehose. | `string` | `"https://aws-api.newrelic.com/firehose/v1"` | no |
| <a name="input_firehose_bucket_expiration_days"></a> [firehose\_bucket\_expiration\_days](#input\_firehose\_bucket\_expiration\_days) | Specifies the retention period for error records of Firehose. The value must be `0` or greater. If this parameter is not specified, the retention period will be indefinite. | `number` | `null` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. | `string` | `"RDSEventSubscription"` | no |
| <a name="input_event_subscriptions"></a> [event\_subscriptions](#input\_event\_subscriptions) | Specifies the parameters necessary to configure event subscription.  For details on the event subscription parameters, refer to https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_event_subscription | <pre>list(object({<br>    name             = optional(string, "RDSEventSubscription")<br>    source_type      = string<br>    source_ids       = optional(list(string), null)<br>    event_categories = optional(list(string), null)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.

## Usage
### 1. Deploy module with refer to example usage

## Example Usage
```hcl
module "aws-rds-event-integration" {
  source               = "falcon-terraform-modules/aws-rds-event-integration/newrelic"
  newrelic_license_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  event_subscriptions = [
    {
      name             = "RDSEventSubscription"
      source_type      = "db-cluster"
      event_categories = ["failover"]
    }
  ]
  firehose_bucket_expiration_days = 7
}
```
<!-- END_TF_DOCS -->