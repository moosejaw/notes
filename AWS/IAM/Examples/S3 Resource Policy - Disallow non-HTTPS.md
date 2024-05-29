#aws #iam #s3 #resource_policy

```json
{
	"Statement": [
		{
			"Effect": "Deny",
			"Principal": "*",
			"Action": "s3:*",
			"Resource": "<bucket_arn>",
			"Condition": {
				"Bool": {
					"aws:SecureTransport": "false"
				}
			}
		}
	],
	"Version": "2012-10-17"
}
```