resource "aws_instance" "myec2" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  vpc_security_group_ids =[ aws_security_group.ec2sg.id] 
  # for_each = toset(data.aws_availability_zones.awsaz.names)
  for_each = toset(keys({for az,details in data.aws_ec2_instance_type_offerings.validInstance:
            az=>details.instance_types if length(details.instance_types)!=0
  }))

  tags = {
    Name = "myec2am2-${each.key}"
  }
}