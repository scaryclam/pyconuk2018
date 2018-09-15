resource "aws_security_group" "sample-sg-1" {
    name = "sample-sg-1"
    description = "Security Group for the sample server"
    vpc_id = "${aws_vpc.sample.id}"
  
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
