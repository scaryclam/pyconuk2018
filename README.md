# PyconUK 2018


Welcome to this little repo. Here you can find the sample Terraform setup that I spoke about at PyconUK 2018.

Please feel free to with it as you please. Any corrections, updates or suggestions are more than welcome, just drop in a PR or raise an issue if you prefer and I'll try and get to it as soon as I can.


## Getting started

So, if you've not used Terraform before and this is your first delve into it, some things may still not make sense. I'll explain the file structure so you can better see what I'm doing. The file structure is not a standard, it just seems convienient.

```
    ├── instances.tf                                                                                                                                                                                                                                                               
    ├── keys.tf                                                                                                                                                                                                                                                                    
    ├── networking.tf                                                                                                                                                                                                                                                              
    ├── provider.tf                                                                                                                                                                                                                                                                
    ├── README.rst                                                                                                                                                                                                                                                                 
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
