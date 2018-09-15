# Create VPC for application environment
resource "aws_vpc" "sample" {
    cidr_block = "172.16.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags {
        Name = "sample-vpc"
    }
}


# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "sample" {
    vpc_id = "${aws_vpc.sample.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
    route_table_id = "${aws_vpc.sample.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.sample.id}"
}

# Create a subnets to launch our instances into
resource "aws_subnet" "sample-eu-west-1a" {
    availability_zone = "eu-west-1a"
    vpc_id = "${aws_vpc.sample.id}"
    cidr_block = "172.16.1.0/24"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "sample-eu-west-1b" {
    availability_zone = "eu-west-1b"
    vpc_id = "${aws_vpc.sample.id}"
    cidr_block = "172.16.2.0/24"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "sample-eu-west-1c" {
    availability_zone = "eu-west-1c"
    vpc_id = "${aws_vpc.sample.id}"
    cidr_block = "172.16.3.0/24"
    map_public_ip_on_launch = true
}
