provider "aws" {
    profile = "default"
    region = "eu-west-1"
    shared_credentials_file = "/home/becky/.aws/credentials-sandbox"
}


terraform {
    backend "s3" {
        bucket = "test-tf-states"
        key = "sample.tfstate"
        region = "eu-west-1"
        shared_credentials_file = "/home/becky/.aws/credentials-sandbox"
    }
}

