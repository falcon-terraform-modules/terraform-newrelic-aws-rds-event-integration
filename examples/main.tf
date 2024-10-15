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