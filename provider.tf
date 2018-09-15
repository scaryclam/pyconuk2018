# This is the provider definition
provider "aws" {
    profile = "default"
    region = "eu-west-1"
    # Point this to your aws credentials file
    shared_credentials_file = "/home/username/.aws/credentials-sandbox"
}

# This is the remote state backend configuration
terraform {
    backend "s3" {
        # Change this to your bucket
        bucket = "test-tf-states"
        key = "sample.tfstate"
        region = "eu-west-1"
        # Point this to your AWS credentials file
        shared_credentials_file = "/home/username/.aws/credentials-sandbox"
    }
}

