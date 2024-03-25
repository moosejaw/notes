#aws #rds 

Date of script creation: 2024-03-25.

Script to apply pending RDS DB maintenance at the next configured maintenance window. Assumes you are using SSO profiles configured in file `~/.aws/config`.

https://awscli.amazonaws.com/v2/documentation/api/latest/reference/rds/describe-pending-maintenance-actions.html

```bash
#!/usr/bin/env bash

# Get a list of all the SSO profile names in the AWS SSO config file.
# This command reads each [profile <name>] block and cuts out the leading '[profile '
# and trailing ']'.
profiles=$(cat ~/.aws/config | grep -e 'profile' | cut -c 10- | tr -d ']')

# For each profile, we will get a list of database instances, checking if each one has
# maintenance available.
for profile in $profiles; do
	export AWS_PROFILE=$profile

	# Get the instance identifiers
	instances=$(aws rds describe-db-instances --query 'DBInstances[*].DBInstanceArn' --output text)

	# Check if each has a pending system update maintenance action
	for instance in $instances; do
		has_maintenance=$(aws rds describe-pending-maintenance-actions --resource-identifier $instance --query "PendingMaintenanceActions[*].PendingMaintenanceActionDetails[?Action == 'system-update'].Action" --output text | wc -l)

		if [ $has_maintenance -eq 1 ]; then
			echo "Has pending maintenance | $instance"

			aws rds apply-pending-maintenance-action --resource-identifier $instance --apply-action system-update --opt-in-type next-maintenance
		fi
	done
done
```
