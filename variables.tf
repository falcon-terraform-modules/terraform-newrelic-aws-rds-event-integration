variable "newrelic_license_key" {
  description = "This is your New Relic ingest license key, and it is needed for Kinesis Firehose to successfully send logs to your New Relic account."
  type        = string
}

variable "newrelic_collector_endpoint" {
  description = "This is the New Relic collector endpoint. The URL changes based on your account region (US/EU), and can be found on https://docs.newrelic.com/jp/docs/logs/forward-logs/stream-logs-using-kinesis-data-firehose."
  type        = string
  default     = "https://aws-api.newrelic.com/firehose/v1"
}

variable "firehose_bucket_expiration_days" {
  description = "Specifies the retention period for error records of Firehose. The value must be `0` or greater. If this parameter is not specified, the retention period will be indefinite."
  type        = number
  default     = null
}

variable "sns_topic_name" {
  description = "The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long."
  type        = string
  default     = "RDSEventSubscription"
}

variable "event_subscriptions" {
  description = "Specifies the parameters necessary to configure event subscription.  For details on the event subscription parameters, refer to https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_event_subscription"
  type = list(object({
    name             = optional(string, "RDSEventSubscription")
    source_type      = string
    source_ids       = optional(list(string), null)
    event_categories = optional(list(string), null)
  }))
}