#!/bin/bash -e

echo ""
echo "Infrastructure Bootstrapping"
echo ""

# pull application name from package.json
APPLICATION_NAME=$(cat ../package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

# get repository url from git
REPO_URL=$(git config --get remote.origin.url)
REPO_NAME=$(basename -s .git $REPO_URL)
AWS_REGION="us-east-2"
REPO_OWNER="inventivegroup"

read -p "Enter AWS region to deploy to (default ${AWS_REGION}): " AWS_REGION_READ
AWS_REGION=${AWS_REGION_READ:-$AWS_REGION}

read -p "Enter GitHub repository owner (default ${REPO_OWNER}): " REPO_OWNER_READ
REPO_OWNER=${REPO_OWNER_READ:-$REPO_OWNER}

echo "Enter a personal GitHub access token. Generate one here: https://github.com/settings/tokens (scopes needed: admin:repo_hook, repo)"
read GITHUB_OAUTH_TOKEN

echo ""
echo "AWS Region: ${AWS_REGION}"
echo "ApplicationName: ${APPLICATION_NAME}"
echo "GithubRepoName: ${REPO_NAME}"
echo "GitHubRepoOwner: ${REPO_OWNER}"
echo "GitHubOAuthToken: ${GITHUB_OAUTH_TOKEN}"
echo ""

aws --region ${AWS_REGION} cloudformation create-stack \
  --stack-name $APPLICATION_NAME \
  --template-body file://pipeline.yaml \
  --capabilities CAPABILITY_IAM \
  --parameters \
    "ParameterKey=ApplicationName,ParameterValue=${APPLICATION_NAME}" \
    "ParameterKey=GithubRepoName,ParameterValue=${REPO_NAME}" \
    "ParameterKey=GitHubRepoOwner,ParameterValue=${REPO_OWNER}" \
    "ParameterKey=GitHubOAuthToken,ParameterValue=${GITHUB_OAUTH_TOKEN}" \
