# NewRelic-lambda-config-logs

## Requirements

```
 AWS_DEFAULT_REGION
 AWS_ACCESS_KEY_ID
 AWS_SECRET_ACCESS_KEY
 NR_API_KEY
 NR_ACCOUNT_ID
 FUNCTION_NAME
```

## How to run

```
docker run \
-e AWS_DEFAULT_REGION=your_region_aws\
-e AWS_ACCESS_KEY_ID=your_access_key \
-e AWS_SECRET_ACCESS_KEY=your_secret_key \
-e NR_API_KEY=your_api_key \
-e NR_ACCOUNT_ID=your_account_id \
-e FUNCTION_NAME=your_function_name \
chrisrol/newrelic-lambda-config:v0.1
```

## How to build

```
docker build -t chrisrol/newrelic-lambda-config:v0.1 . && \
 docker tag chrisrol/newrelic-lambda-config:v0.1 chrisrol/newrelic-lambda-config:latest


```

## How to build public image

```
docker push chrisrol/newrelic-lambda-config:v0.1 && \
docker push chrisrol/newrelic-lambda-config:latest
```
