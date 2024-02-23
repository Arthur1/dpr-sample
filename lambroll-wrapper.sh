#!/bin/sh

set -e
cd "$(dirname "$0")"

TAG=$(cat lambroll/tag.txt)
DEPLOY_PACKAGE_INFO=$(dprc pull -t "${TAG}" --check-only)
S3_BUCKET=$(echo "${DEPLOY_PACKAGE_INFO}" | jq .s3_bucket -r)
S3_KEY=$(echo "${DEPLOY_PACKAGE_INFO}" | jq .s3_key -r)
export LAMBROLL_EXTSTR="s3_bucket=${S3_BUCKET};s3_key=${S3_KEY}"
exec lambroll "$@"
