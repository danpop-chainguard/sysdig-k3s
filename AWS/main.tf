# Create a new instance of the latest Ubuntu 20.04 on an
# t3.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.xlarge"
  key_name = "keyname!"
  tags = {
    Name = "POPTEST"
    expirationDate = "10-8-2020"
    description = "blog"
    approver = "GOD"
  }
}
