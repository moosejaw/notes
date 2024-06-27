#aws #s3 #aws-cli

Replace `<bucket_name>` with the name of the bucket (just the bucket name, and not the S3 URI format).

Replace `<prefix>` with the prefix (or folders) to be searched.

`--recursive` is implied.

```bash
aws s3api list-objects --bucket "<bucket_name>" --prefix "foo/2024/05/23" --query "Contents[].{Key: Key}" --output text
```
