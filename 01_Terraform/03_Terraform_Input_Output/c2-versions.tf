# What are data sources?
# - Bring information outside terraform to inside
# - get info of other tf config

# AMI Data source
data "aws_ami" "amxLinux2" {
  most_recent      = true
  owners           = ["amazon"]
# How to get ami name : console->copy ami id from launch instance
# -> goto AMI->search for AMI ID= ${ami id} copy the name 
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
#   make sure you have Architecture 64-bit (x86)?
    filter {
      name="architecture"
      values = ["x86_64"]
    }

}

# resource "aws_instance" "myec2"{
#     ami = "ami-0a3c3a20c09d6f377"
#     instance_type = "t2.micro"
# }

resource "aws_security_group" "vpc-ssh" {
  name = "allow-ssh"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-ssh"
  }

}

resource "aws_security_group" "vpc-web" {
  name = "allow-http"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-http"
  }

}
