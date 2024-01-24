# Resource in ec2 instance
resource "aws_instance" "myec2vm" {
  ami = "ami-0c0b74d29acd0cd97"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  user_data = file("app1-install.sh")
  tags = {
    "Name" = "EC2 Demov"
  }
}