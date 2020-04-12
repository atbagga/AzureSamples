#!/bin/bash

result=$(az ad sp create-for-rbac)
echo \"arg1 is: $1\"
echo \"arg2 is: $2\"
echo $result | jq -r '.appId, .name, .displayName, .tenant' > $AZ_SCRIPTS_OUTPUT_PATH
if [ $? -eq 1 ]
then echo 'Deletion Error! Cleanup Resource Group $Basic_ResourceGroupName manually.'
exit 1
fi
