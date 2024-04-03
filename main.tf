## Provision us-east-1 region
provider "aws" {
  region  = "us-east-1"
}

## EC2
resource "aws_instance" "demo_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "app-ssh-key"
tags = {
    Name = var.ec2_name
  }
}

## Ubuntu AMI
data "aws_ami" "ubuntu" {
    most_recent = true
filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }
filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
