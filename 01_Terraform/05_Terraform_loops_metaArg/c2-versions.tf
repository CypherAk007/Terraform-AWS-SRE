data "aws_ami" "amzn2" {
  most_recent      = true
  owners           = ["amazon"]

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

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  
}

resource "aws_security_group" "web-traffic" {
  name = "http"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = ""
  }
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.amzn2.id
  instance_type = var.instance_type_list[0]
  key_name = var.key_pair
  user_data = file("${path.module}/app1-install.sh")
  # count = 5
  vpc_security_group_ids = [aws_security_group.web-traffic.id]
  # accepts maps or set of strings not list ->convert list to set using toset()
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key
  tags = {
    Name = "myEC2-${each.key}"
  }
}
