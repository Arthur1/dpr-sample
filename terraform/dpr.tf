module "dpr" {
  source                                = "github.com/Arthur1/dpr//terraform/dpr?ref=v0.1.0-alpha.6"
  package_store_s3_bucket_name          = "arthur-1-dpr-test"
  tag_db_dynamodb_table_name            = "arthur-1-dpr-test"
  lifecycle_policy_file_path            = "../dprlifecyclepolicy.yml"
  scheduled_cleaner_schedule_expression = "rate(10 minutes)"
  tags                                  = local.tags
}
