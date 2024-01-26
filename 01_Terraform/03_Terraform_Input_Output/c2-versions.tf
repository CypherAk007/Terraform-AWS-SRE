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