# terraform-automation
Terraform Cloud <-> Github <-> AWS automation demo

This is a demo repository to demonstrate GitOps automation using Terraform Cloud and Terraform for provisioning AWS resources.

# Pre-requisites
* Terraform Cloud account: https://app.terraform.io
* AWS Account: https://aws.amazon.com/free
* Github account: https://github.com/

# Setup Instructions

## Steps
### Authentication setup
#### 1. Terraform Cloud <-> Github
Setup OIDC between Terraform Cloud and Github using Github and Terraform Cloud apps ([Official documentation](https://developer.hashicorp.com/terraform/tutorials/cloud/github-oauth
))

#### 2. Terraform Cloud <-> AWS
Setup authentication between Terraform Cloud and AWS ([Official documentation](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/aws-configuration)):
* Create an Identity Provider (OIDC)
* Create and assign IAM role to Identity Provider ( OIDC)
* Configure Terraform Cloud environment variables to assume newly created role:
    * TFC_AWS_RUN_ROLE_ARN: arn:aws:iam::$accountid:role/$rolename	
    * TFC_AWS_PROVIDER_AUTH: true

### Configuration
1. Configure Terraform Cloud workspace:
    * Execution mode: Remote
    * Automatic speculative plans: yes
    * VCS branch: main
2. Configure Github repository:
    * Branch protection rule: 
        * main branch - require a pull request before merging

## Deployment Workflow
* New pull requests will trigger a Terraform plan against the Github PR branch.
* Merging a branch to main will trigger a Terraform plan (against the main branch) and prompt a user to approve the Terraform apply in Terraform Cloud.


# Terraform Docs    
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_config"></a> [bucket\_config](#input\_bucket\_config) | Bucket configuration | `map(string)` | n/a | yes |
| <a name="input_demo-bucket-name"></a> [demo-bucket-name](#input\_demo-bucket-name) | Bucket name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->