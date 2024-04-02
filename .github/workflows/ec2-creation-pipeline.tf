##Random
resource "random_pet" "sg" {
}

##AWS VPC
resource "aws_vpc" "ec2campus" {
    cidr block = "172.16.0.0/16"

    tags = {
        Name = "vpc-quickcloudpocs"
    }
}

##AWS VPC Subnet
resource "aws-subnet" "ec2campus" {
    vpc_id = aws_vpc.awsec2demo.id 
    cidr_block = "172.16.10.0/24"

    tags = {
        Name = "subnet-quickcloudpocs"
    }
}

##AWS Network Interface
resource "aws_network_interface" "awsec2demo" {
    subnet_id = aws_subnet.awsec2demo.id 
    pribate_ips = [172.16.10.100]

    tags = {
        Name = "NI-quickcloudpocs"
    }
}

##AWS Security Group
resource "aws_security_group" "awsec2demo" {
    name = "${random_pet.sg.id}-sg"
    vpc_id = aws_vpc.awsec2demo.id
   
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

##AWS EC2
resource "aws_instance" "awsec2demo" {
    ami = "" #us-east-1
    instace_type = "t.micro"

    network_interface {
        network_interface_id = aws_network_interface.awsec2demo.id 
        device_index = 0
    }
}
