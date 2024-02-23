{
  FunctionName: 'dpr-sample-lambda',
  Runtime: "provided.al2023",
  MemorySize: 128,
  Architectures: [
    'arm64',
  ],
  Handler: 'main',
  Role: "arn:aws:iam::587596360660:role/dpr-sample-lambda-role",
  Timeout: 7,
  PackageType: "Zip",
  Code: {
    S3Bucket: std.extVar('s3_bucket'),
    S3Key: std.extVar('s3_key'),
  },
  Tags: {
    "Managed-by": "terraform",
    "Owner": "arthur-1"
  },
}
