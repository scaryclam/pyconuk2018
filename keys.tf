resource "aws_key_pair" "sample-key" {
    key_name = "sample-instance-key-1" 
    public_key = "${file("~/.ssh/sample.pem.pub")}"
}
