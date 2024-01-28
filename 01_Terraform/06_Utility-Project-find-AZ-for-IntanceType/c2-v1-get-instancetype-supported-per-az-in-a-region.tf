# DataSource
data "aws_ec2_instance_type_offerings" "my_ins_type1" {
  filter {
    name   = "instance-type"
    values = [ "t2.micro","t3.micro"]
  }

  filter {
    name   = "location"
    values = ["us-east-1a"]
    # # o/p-> + output_v1_1 = [
    #   + "t2.micro",
    #   + "t3.micro",
    # ]

    # values = ["us-east-1e"]
    # o/p -> + output_v1_1 = [
    # #   + "t2.micro",
    # # ]

  }

  location_type = "availability-zone"
}


# Output 
output "output_v1_1" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
}


