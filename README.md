# PyconUK 2018


Welcome to this little repo. Here you can find the sample Terraform setup that I spoke about at PyconUK 2018.

Please feel free to with it as you please. Any corrections, updates or suggestions are more than welcome, just drop in a PR or raise an issue if you prefer and I'll try and get to it as soon as I can.


## About the files here

So, if you've not used Terraform before and this is your first delve into it, some things may still not make sense. I'll explain the file structure so you can better see what I'm doing. The file structure is not a standard, it just seems convienient.

```
    ├── instances.tf
    ├── keys.tf
    ├── networking.tf
    ├── provider.tf
    ├── README.md                                                                                                                                                                                                                                                                 
    ├── resources
    │   ├── salt
    │   │   └── sample-server
    │   │       ├── minion
    │   │       ├── packages.sls
    │   │       └── top.sls
    │   └── user-data
    │       └── sample-server.sh
    └── security-groups.tf
```

### The root directory

instances.tf <-- This is where the EC2 instance resource is defined

keys.tf <-- This is where the SSH key for the instance is defined. You'll want to edit this one and point it at an SSH key of your choice

networking.tf <-- This one is all about creating a VPC and the networking bits and pieces required for it. You'll see the VPC, the internet gateway, route and a few subnets in there. You don't **need** to create your own VPC, it's more or less here to demonstrate how you would if you needed to.

provider.tf <-- This is the provider! It's got the definition for the AWS provider. You should update the path to the AWS credentials file there. There's a remote state in this file as well. You should change the bucket name to an S3 bucket that you have access to and point to your own AWS credentials file.

security-groups.tf <-- This is where the security groups and their ingress/egress rules are setup


### The resources directory

This isn't strictly needed and is **not** a Terraform thing at all. This directory contains two things:

 1) The user-data script for AWS. This script does absolutely nothing useful in this case :D

 2) A saltstack manifest. Again, this is pretty useless for anything practical at the moment


## Getting things to run

Read up about the files above and make any required changes to point things at your own aws credentials and ssh key.

Make sure you've [installed Terraform](https://www.terraform.io/intro/getting-started/install.html).

Once that's done...

`$ terraform init`

This is important to run as it will make sure Terraform has the right providers and backends initialised. If you change your provider or your backends then you'll need to re-run this command.

`$ terraform plan`

This will tell you what Terraform plans on doing. You *could* just run the apply command, but it's a good idea to check your plan first.

`$ terraform apply`

This will create your infrastructure!

If you want to tear it all down again, run:

```
$ terraform plan --destroy
$ terraform destroy
```

