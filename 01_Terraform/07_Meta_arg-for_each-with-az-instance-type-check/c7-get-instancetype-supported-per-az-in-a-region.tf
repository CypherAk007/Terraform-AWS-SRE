data "aws_availability_zones" "awsaz" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

output "aws_az" {
  value = data.aws_availability_zones.awsaz.names
}

data "aws_ec2_instance_type_offerings" "validInstance" {
  for_each = toset(data.aws_availability_zones.awsaz.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

output "valid_Instance" {
  value = keys({for az,details in data.aws_ec2_instance_type_offerings.validInstance:
            az=>details.instance_types if length(details.instance_types)!=0
  })
}