# Storage Platform Terraform Assignment

This project provisions AWS infrastructure using Terraform and automates validation through GitHub Actions.

## Resources Provisioned

The following AWS resources are created:

* Amazon S3 Bucket
* IAM User
* IAM Policy
* IAM User Policy Attachment

## Repository Structure

storage-platform/
│
├── .github
│   └── workflows
│       └── deploy.yml
│
├── terraform
│   ├── provider.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
└── README.md

## Prerequisites

* AWS Account
* Terraform
* Git
* GitHub Repository

## Terraform Workflow

Initialize Terraform:

terraform init

Validate Configuration:

terraform validate

Generate Execution Plan:

terraform plan

## CI/CD Pipeline

GitHub Actions is configured to automatically execute the following steps on every push to the main branch:

1. Checkout Repository
2. Configure AWS Credentials
3. Terraform Init
4. Terraform Format Check
5. Terraform Validate
6. Terraform Plan

## GitHub Secrets

The workflow uses the following repository secrets:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

## Outputs

The Terraform configuration outputs:

* Bucket Name
* Bucket ARN
* IAM User Name
* Policy ARN

## Notes

This project performs Terraform validation and planning through GitHub Actions. Infrastructure deployment is not automatically applied and requires a manual Terraform apply if resource creation is desired.
