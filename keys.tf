resource "aws_key_pair" "sample-key" {
    key_name = "sample-instance-key-1" 
    # You'll want this next line to point to a public key file of your choice
    public_key = "${file("~/.ssh/sample.pem.pub")}"
}
