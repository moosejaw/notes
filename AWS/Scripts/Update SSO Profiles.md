#aws #sso 

Date of script creation: 2024-03-05.

Script to update AWS config file at `~/.aws/config` with all available accounts in the SSO instance.

First create a file called `session_template.txt` in the same folder as the script and include your SSO session details, e.g.:

```text
[sso-session session]
sso_start_url = https://d-abc123def456.awsapps.com/start/
sso_region = eu-west-1
sso_registration_scopes = sso:account:access
```

Then use this script:

```bash
#!/usr/bin/env bash
sso_session_name="session_name"
region="eu-west-1"

# Back up existing config file
cp ~/.aws/config ~/aws/config.old

echo "Current AWS config backed up to ~/aws/config.old"

# Extract SSO access token from cache
# Use the latest modified cache file and extract its access token
latest_cache=$(ls -1t ~/.aws/sso/cache | head -1 | tr -d '\n')
access_token=$(cat ~/.aws/sso/cache/$latest_cache | jq '.accessToken' | tr -d '"' | tr -d '\n')

# Call AWS API to list accounts
accounts=$(aws sso list-accounts --access-token $access_token --region eu-west-1 | jq '.accountList[] | .accountName + "," + .accountId' | tr -d '"')

# Build SSO profile file
cat session_template.txt > /tmp/new_config

for l in $(echo $accounts); do
	name=$(echo $l | cut -d "," -f 1)
	id=$(echo $l | cut -d "," -f 2)

	cat << EOF >> /tmp/new_config
[profile $name]
sso_session = $sso_session_name
sso_account_id = $id
sso_role_name = AdministratorAccess
region = $region
EOF

done

echo "Generated new config file at ~/.aws/config"
cp /tmp/new_config ~/.aws/config
```
