#!/bin/bash

# Check if original environment variables are set; otherwise, use ones with INPUT_ prefix
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-$INPUT_AWS_ACCESS_KEY_ID}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-$INPUT_AWS_SECRET_ACCESS_KEY}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-$INPUT_AWS_DEFAULT_REGION}"
NR_ACCOUNT_ID="${NR_ACCOUNT_ID:-$INPUT_NR_ACCOUNT_ID}"
NR_API_KEY="${NR_API_KEY:-$INPUT_NR_API_KEY}"
FUNCTION_NAME="${FUNCTION_NAME:-$INPUT_FUNCTION_NAME}"

# Ensure required environment variables are set
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ] || [ -z "$NR_ACCOUNT_ID" ] || [ -z "$NR_API_KEY" ] || [ -z "$FUNCTION_NAME" ]; then
    echo "Error: Necessary environment variables are not set."
    exit 1
fi

# Configure AWS credentials using aws-cli
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION

# Run commands to set up New Relic Lambda configurations
newrelic-lambda integrations install --nr-account-id $NR_ACCOUNT_ID --nr-api-key $NR_API_KEY
newrelic-lambda layers install -f $FUNCTION_NAME --nr-account-id $NR_ACCOUNT_ID --disable-extension
newrelic-lambda subscriptions install -f $FUNCTION_NAME
