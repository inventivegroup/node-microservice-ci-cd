#!/bin/bash -e

echo "Enter your GitHub user name."
read GITHUB_USER_NAME

echo "Enter a personal GitHub access token. Generate one here: https://github.com/settings/tokens (scopes needed: admin:repo_hook, repo)"
read GITHUB_OAUTH_TOKEN

aws --region us-east-2 cloudformation create-stack --stack-name "node-microservice-ci-cd" --template-body file://pipeline.yaml --parameters "ParameterKey=GitHubUserName,ParameterValue=${GITHUB_USER_NAME}" "ParameterKey=GitHubOAuthToken,ParameterValue=${GITHUB_OAUTH_TOKEN}" --capabilities CAPABILITY_IAM