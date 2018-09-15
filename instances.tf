resource "aws_instance" "sample-server-1" {
    ami = "ami-47a23a30"
    instance_type = "t2.micro"
    key_name = "sample-instance-key-1"
    vpc_security_group_ids = ["${aws_security_group.sample-sg-1.id}"]
    user_data = "${file("resources/user-data/sample-server.sh")}"
    subnet_id = "${aws_subnet.sample-eu-west-1a.id}"
    tags {
        Name = "sample-web"
    }

    # Add some files to the server
    provisioner "file" {
        source = "resources/salt/sample-server"
        destination = "/tmp/salt"
        connection {
            user = "ubuntu"
            private_key = "${file("~/.ssh/sample.pem")}"
            timeout = "1m"
            host = "${aws_instance.sample-server-1.public_ip}"
        }
    }

    provisioner "remote-exec" {
        inline = [
        "sudo mv /tmp/salt /srv/salt/",
        ]
        connection {
            user = "ubuntu"
            private_key = "${file("~/.ssh/sample.pem")}"
            timeout = "1m"
            host = "${aws_instance.sample-server-1.public_ip}"
        }
    }
}

output "sample_instance_ip" {
    value = "${aws_instance.sample-server-1.public_ip}"
}

