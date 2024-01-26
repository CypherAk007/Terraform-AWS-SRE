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
