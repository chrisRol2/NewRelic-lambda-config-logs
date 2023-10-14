#!/bin/bash

# Ensure environment variables are defined
if [ -z "$NR_ACCOUNT_ID" ] || [ -z "$NR_API_KEY" ] || [ -z "$FUNCTION_NAME" ]; then
    echo "Error: Environment variables NR_ACCOUNT_ID, NR_API_KEY, and FUNCTION_NAME must be set."
    exit 1
fi

# Run the command to install New Relic Lambda integrations
newrelic-lambda integrations install --nr-account-id $NR_ACCOUNT_ID --nr-api-key $NR_API_KEY

# Run the command to install New Relic Lambda layers
newrelic-lambda layers install -f $FUNCTION_NAME --nr-account-id $NR_ACCOUNT_ID --disable-extension

# Run the command to install New Relic Lambda subscriptions
newrelic-lambda subscriptions install -f $FUNCTION_NAME
