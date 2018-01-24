# Example Node Microservice with CI/CD

## Prerequisites

`node@8.x.x`

`npm@5.x.x`
## Setup

1. cd into the infrastructure directory: `cd infrastructure/`
2. run: `./init.sh`

## How it works

This will setup a CodePipeline to:

* connect to the GitHub repository
* update itself
* create/update a ElasticBeanstalk application
* create/update a staging ElasticBeanstalk environment
* deploy a new application version to the qa environment
* create/update a production ElasticBeanstalk environment
* deploy a new application version to the production environment

## Assumptions
### Docker Image Uploading
By default this will attempt to upload the docker image to `<account_id>.dkr.ecr.us-east-2.amazonaws.com/node-microservice-ci-cd`.

To change this, you can change the `buildspec.yml` file's `REPOSITORY_URI` environment variable.

### Secret Management 
This will use AWS SSM to store the database passwords. By default it will look for a `example-ci-cd-db-password-qa` and `example-ci-cd-db-password-prod` parameter for their respective environments. 

To change this, you can change the `environment-qa.input.json` and `environment-prod.input.json` files. 

## Cleanup

To delete all AWS resources, remove the CloudFormation stacks in the following order:

1. node-microservice-ci-cd-prod & node-microservice-ci-cd-qa
2. node-microservice-ci-cd-application
3. node-microservice-ci-cd

## Linting
This project uses `eslint` for code linting. Specifically it uses [eslint-config-airbnb-base](https://www.npmjs.com/package/eslint-config-airbnb-base).
