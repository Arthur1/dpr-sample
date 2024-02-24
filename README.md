# dpr-sample

## Preparation

- terraform
- lambroll
  - `brew install fujiwara/tap/lambroll`
- jq
  - `brew install jq`
- dprc
  - `brew install dprc`

## Create dpr & Lambda

```sh
export AWS_PROFILE="hogehoge"
cd terraform
terraform init
terraform apply
```

## Push to dpr

If you edit terraform/dpr.tf to prevent resource name collisions, please edit dprcconfig.yml to correspond.

```console
$ dprc push ./lambda.zip -t latest
Pushed the deploy package. digest=sha256:aadc4765398cf2ae8862557264c8b366e9d5161be1fa9e9ff4ff176648ba6148
```

## Pull to dpr

```console
$ dprc pull -t latest
{"s3_bucket":"arthur-1-dpr-test","s3_key":"sha-aadc4765398cf2ae8862557264c8b366e9d5161be1fa9e9ff4ff176648ba6148.zip"}
```

## Debug lifecycle policy 

This is the command for debugging lifecycle policy. Even if you do not run the command manually, scheduled cleaner will remove expired packages automatically. 

```console
$ drpc push README.md
Pushed the deploy package. digest=sha256:387dc5277edecae7a90aa615a93ed9c3ea0aa67f75f02c2d822d24d2e1010dca
$ drpc apply-lifecycle-policy ./dprlifecyclepolicy.yml --dry-run
The following packages are expired:
- sha256-387dc5277edecae7a90aa615a93ed9c3ea0aa67f75f02c2d822d24d2e1010dca.md
$ dprc apply-lifecycle-policy ./dprlifecyclepolicy.yml
The following packages are expired:
- sha256-387dc5277edecae7a90aa615a93ed9c3ea0aa67f75f02c2d822d24d2e1010dca.md
Deleted.
```

## Deploy using lambroll

```console
$ cat ./lambroll/tag.txt
latest
$ ./lambroll-wrapper.sh deploy --function ./lambroll/function.jsonnet --skip-archive
2024/02/24 01:20:41 [info] lambroll v1.0.1 with ./lambroll/function.jsonnet
2024/02/24 01:20:41 [info] starting deploy function dpr-sample-lambda
2024/02/24 01:20:41 [info] updating function configuration
2024/02/24 01:20:41 [info] updating function configuration ...
2024/02/24 01:20:41 [info] State:Active LastUpdateStatus:Successful
2024/02/24 01:20:41 [info] updating function configuration accepted. waiting for LastUpdateStatus to be successful.
2024/02/24 01:20:42 [info] State:Active LastUpdateStatus:InProgress
2024/02/24 01:20:42 [info] waiting for LastUpdateStatus Successful
2024/02/24 01:20:43 [info] State:Active LastUpdateStatus:Successful
2024/02/24 01:20:43 [info] updating function configuration successfully
2024/02/24 01:20:43 [info] updating function code ...
2024/02/24 01:20:43 [info] State:Active LastUpdateStatus:Successful
2024/02/24 01:20:44 [info] updating function code accepted. waiting for LastUpdateStatus to be successful.
2024/02/24 01:20:44 [info] State:Active LastUpdateStatus:InProgress
2024/02/24 01:20:44 [info] waiting for LastUpdateStatus Successful
2024/02/24 01:20:45 [info] State:Active LastUpdateStatus:InProgress
2024/02/24 01:20:45 [info] waiting for LastUpdateStatus Successful
2024/02/24 01:20:47 [info] State:Active LastUpdateStatus:InProgress
2024/02/24 01:20:47 [info] waiting for LastUpdateStatus Successful
2024/02/24 01:20:51 [info] State:Active LastUpdateStatus:Successful
2024/02/24 01:20:51 [info] updating function code successfully
2024/02/24 01:20:51 [info] deployed version 7
2024/02/24 01:20:51 [info] updating alias set current to version 7
2024/02/24 01:20:51 [info] alias updated
```
