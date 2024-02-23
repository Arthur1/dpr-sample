# dpr-sample

## preparation

- terraform
- lambroll
  - `brew install fujiwara/tap/lambroll`
- jq
  - `brew install jq`
- dprc
  - `brew install dprc`

## create dpr & lambda

```sh
export AWS_PROFILE="hogehoge"
cd terraform
terraform init
terraform apply
```

## push to dpr

If you edit terraform/dpr.tf to prevent resource name collisions, please edit dprcconfig.yml to correspond.

```console
$ dprc push ./lambda.zip -t latest
```

## pull to dpr

```console
$ dprc pull -t latest
{"s3_bucket":"arthur-1-dpr-test","s3_key":"sha-aadc4765398cf2ae8862557264c8b366e9d5161be1fa9e9ff4ff176648ba6148.zip"}
```

## deploy using lambroll

```console
$ ./lambroll-wrapper.sh deploy --function ./lambroll/function.jsonnet --skip-archive         ✘ 130
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
