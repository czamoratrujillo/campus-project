##AWS
provider "aws" {
  region = "us-east-1"
}

##AWS EC2
resource "aws_instance" "campus-project-ec2" {
    ami = "" #us-east-1
    instace_type = "t.micro"
    tags = {
        "Name" = "EC2Instance"
    }
}
