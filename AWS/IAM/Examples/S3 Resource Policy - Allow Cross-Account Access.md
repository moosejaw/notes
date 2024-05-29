#aws #iam #s3 #resource_policy

Note the trailing `/*` for the `Resource` in the second statement (`GetObject`).
```json
{
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": "*",
			"Action": "s3:ListBucket",
			"Resource": "<bucket_arn>",
			"Condition": {
                "ArnLike": {
                    "aws:PrincipalArn": "<principal_arn>"
                }
			}
		},
		{
			"Effect": "Allow",
			"Principal": "*",
			"Action": "s3:GetObject",
			"Resource": "<bucket_arn>/*",
			"Condition": {
                "ArnLike": {
                    "aws:PrincipalArn": "<principal_arn>"
                }
			}
		}
	],
	"Version": "2012-10-17"
}
```