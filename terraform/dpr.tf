module "dpr" {
  source                        = "github.com/Arthur1/dpr//terraform/dpr?ref=v0.1.0-alpha.1"
  packages_store_s3_bucket_name = "arthur-1-dpr-test"
  tags_db_dynamodb_table_name   = "arthur-1-dpr-test"
  tags                          = local.tags
}
